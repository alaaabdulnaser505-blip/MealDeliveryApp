import "package:flutter/material.dart";
import "../../core/models/recipe_model.dart";

import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "../home/widgets/recipe_list_tile.dart";

class TrendingRecipes extends StatefulWidget {
  final List<RecipeModel> recipeList;
  const TrendingRecipes({ required this.recipeList,super.key});

  @override
  State<TrendingRecipes> createState() => _TrendingRecipesState();
}

class _TrendingRecipesState extends State<TrendingRecipes> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.1,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color:Colors.white),
        ),
        backgroundColor: AppColors.darkRed,
        title: Text("Trending Recipes",
        style:AppTextStyles.titleBold.copyWith(color:Colors.white)),
        centerTitle: true,
      ),
      body:ListView.builder(
              scrollDirection: Axis.vertical,
      itemCount: widget.recipeList.length,
      itemBuilder: (context, i) {
        return RecipeListTile(
            height: height,
            width: width,
            imagePath: widget.recipeList[i].imagePath,
            dishName: widget.recipeList[i].dishName,
            dishDescription: widget.recipeList[i].dishDescription,
            time: widget.recipeList[i].time,
            price: widget.recipeList[i].price,
            rating: widget.recipeList[i].rating);
      }),
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
  }
}
