import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../core/models/recipe_model.dart";
import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../home/widgets/recipe_list_tile.dart";
import "cubit/search_cubit.dart";
import "cubit/search_state.dart";

class SearchScreen extends StatefulWidget {
  final List<RecipeModel> allRecipes;

  const SearchScreen({super.key, required this.allRecipes});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex=0;
  final TextEditingController dishSearched = TextEditingController();

  @override
  void dispose() {
    dishSearched.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SearchCubit(allRecipes: widget.allRecipes),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SearchCubit>();

          return Scaffold(
            backgroundColor: const Color(0xffFAFAFA),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.darkRed,
                    height: height * 0.055,
                    width: double.infinity,
                  ),
                  Container(
                    color: AppColors.brightRed,
                    height: height * 0.221,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.033),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                            ),
                            SizedBox(width: width * 0.1),
                            Text(
                              "Search Dishes",
                              style: AppTextStyles.titleBold.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.045),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                          child: BlocBuilder<SearchCubit, SearchState>(
                            builder: (context, state) {
                              final showClearButton = state is! SearchInitial;

                              return TextField(
                                enabled: true,
                                controller: dishSearched,
                                textInputAction: TextInputAction.search,
                                onChanged: (val) => cubit.onQueryChanged(val),
                                onSubmitted: (val) => cubit.submitSearch(val),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(width * 0.04),
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: showClearButton
                                      ? IconButton(
                                    icon: const Icon(Icons.close, color: Colors.grey),
                                    onPressed: () {
                                      dishSearched.clear();
                                      cubit.clearSearch();
                                    },
                                  )
                                      : null,
                                  hintText: 'Search dishes',
                                  hintStyle: const TextStyle(fontSize: 18),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.025,
                    ),
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchInitial) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Popular Searches", style: AppTextStyles.categoryTitle),
                              SizedBox(height: height * 0.015),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: state.popularSearches.map((tag) {
                                  return ActionChip(
                                    label: Text(tag.dishName),
                                    backgroundColor: Colors.white,
                                    side: BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onPressed: () {
                                      dishSearched.text = tag.dishName;
                                      cubit.submitSearch(tag.dishName);
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }

                        if (state is SearchSuggestions) {
                          if (state.suggestions.isEmpty) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text("No matching dishes found..."),
                              ),
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.suggestions.length,
                            separatorBuilder: (_, __) => const Divider(),
                            itemBuilder: (context, index) {
                              final dish = state.suggestions[index];
                              return ListTile(
                                leading: const Icon(Icons.search, color: Colors.grey),
                                title: Text(dish.dishName),
                                trailing: const Icon(Icons.north_west, size: 18, color: Colors.grey),
                                onTap: () {
                                  dishSearched.text = dish.dishName;
                                  FocusScope.of(context).unfocus();
                                  cubit.submitSearch(dish.dishName);
                                },
                              );
                            },
                          );
                        }

                        if (state is SearchResults) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Results for "${state.query}"',
                                style: AppTextStyles.categoryTitle,
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                "${state.results.length} ${state.results.length == 1 ? 'result' : 'results'}",
                                style: AppTextStyles.viewAllRed,
                              ),
                              SizedBox(height: height * 0.02),
                              if (state.results.isEmpty)
                                const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 40),
                                    child: Text("No recipes match your search."),
                                  ),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.results.length,
                                  itemBuilder: (context, i) {
                                    final recipe = state.results[i];
                                    return RecipeListTile(
                                      height: height,
                                      width: width,
                                      imagePath: recipe.imagePath,
                                      dishName: recipe.dishName,
                                      dishDescription: recipe.dishDescription,
                                      time: recipe.time,
                                      price: recipe.price,
                                      rating: recipe.rating,
                                    );
                                  },
                                ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
              bottomNavigationBar: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50)),
                  child: BottomNavigationBar(
                      onTap: (index){
                        setState(() {
                          selectedIndex=index;
                        });
                      },
                      currentIndex: selectedIndex,
                      backgroundColor: Colors.white,
                      selectedItemColor: AppColors.darkRed,
                      unselectedItemColor: Colors.grey,
                      type: BottomNavigationBarType.fixed,
                      elevation: 15,
                      items:[
                        BottomNavigationBarItem(icon:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.home,size:30),
                          ),
                        ),label:"Home",),
                        BottomNavigationBarItem(icon:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: (){
                              //Go to Saved Recipes Page
                            },
                            icon: Icon(Icons.favorite,size:30),
                          ),
                        ),label:"Saved"),
                        BottomNavigationBarItem(icon:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: (){
                              //Go to Cart Page
                            },
                            icon: Icon(Icons.shopping_cart,size:30),
                          ),
                        ),label:"Cart"),
                        BottomNavigationBarItem(icon:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: (){
                              //Go to Profile Page
                            },
                            icon: Icon(Icons.person,size:30),
                          ),
                        ),label:"Profile")
                      ]
                  )),
              extendBody: true
          );
        },
      ),
    );
  }
}