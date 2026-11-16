import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:tripora/features/home/widgets/food_courses.dart";
import "package:tripora/features/home/widgets/recipe_container.dart";
import "package:tripora/features/home/widgets/recipe_list_tile.dart";

import "../../core/theme/app_colors.dart";
import "../../core/theme/app_text_styles.dart";
import "cubit/home_cubit.dart";
import "cubit/home_state.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  TextEditingController dishSearched=TextEditingController();
  @override
  void dispose(){
    dishSearched.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length:3,
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body :SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color:AppColors.darkRed,
                height:height*0.055,
                width:double.infinity,
              ),
              Container(
                  height:height*0.23,
                width:double.infinity,
                decoration: BoxDecoration(
                  color:AppColors.lightRed,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  )),
                child:Padding(
                  padding:EdgeInsets.symmetric(horizontal:width*0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(height:height*0.025),
                      Text("Hello Sandrica!",style:AppTextStyles.titleBold),
                      SizedBox(height:height*0.014),
                      Text("What would you like to make?",style:AppTextStyles.bodySmall),
                      SizedBox(height:height*0.025),
                      TextField(
                        enabled: true,
                        controller:dishSearched,
                        decoration: InputDecoration(
                            contentPadding:EdgeInsets.all(width*0.04),
                            prefixIcon: Icon(Icons.search),
                            hint: Text('Search "dish"', style:TextStyle(fontSize:18)),
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
                          )
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, "search");
                        })]))),
              SizedBox(height:height*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                      Text("Trending Recipes",style:AppTextStyles.categoryTitle),
                    TextButton(
                      onPressed:(){
                        Navigator.pushNamed(context, "trending_recipes");
                      },
                      child:Text
                        ("View All",
                      style:AppTextStyles.viewAllRed)
                    )]),
              SizedBox(height:height*0.01),
              SizedBox(
                height:height*0.33,
                child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
      if(state is HomeSuccess){
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.recipes.length,
        itemBuilder: (context, i) {
          final recipe = state.recipes[i];
          return RecipeContainer(
            height: height,
            width: width,
            dishName: recipe.dishName,
            dishDescription: recipe.dishDescription,
            time: recipe.time,
            price: recipe.price,
            imagePath: recipe.imagePath,
            rating: recipe.rating,
            ontap: () {},
          );
        },
      );}
      else if(state is HomeLoading){
        return Center(child: CircularProgressIndicator(color: AppColors.darkRed,));
      }
      else{
        return Text("Error");
      }})),
              SizedBox(height:height*0.03),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Text("Comfort Food Classics",style:AppTextStyles.categoryTitle),
                    Text("View All",
                            style:AppTextStyles.viewAllRed)
                    ]),
              SizedBox(height:height*0.03),
              SizedBox(
                  height:height*0.33,
                  child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if(state is HomeSuccess){
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.recipes.length,
                            itemBuilder: (context, i) {
                              final recipe = state.recipes[i];
                              return RecipeContainer(
                                height: height,
                                width: width,
                                dishName: recipe.dishName,
                                dishDescription: recipe.dishDescription,
                                time: recipe.time,
                                price: recipe.price,
                                imagePath: recipe.imagePath,
                                rating: recipe.rating,
                                ontap: () {},
                              );
                            },
                          );}
                        else if(state is HomeLoading){
                          return Center(child: CircularProgressIndicator(color: AppColors.darkRed,));
                        }
                        else{
                          return Text("Error");
                        }})),
                      SizedBox(height:height*0.06),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:width*0.05),
                        child: Text("Endless Culinary Journey",
                        style:AppTextStyles.categoryTitle),
                      ),
              SizedBox(height:height*0.02),
                  TabBar(
                      labelColor: AppColors.darkRed,
                      indicatorColor: AppColors.darkRed,
                    tabs:[
                      Tab(text:"Main Courses"),
                      Tab(text:"Appetizers"),
                      Tab(text:"Side Dishes")
                    ]),
              SizedBox(
                height:height*0.7,
                width:width,
                child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state is HomeSuccess){
                  return TabBarView(
                        children:[
                          FoodCourses(recipeList: state.mainCourses,),
                          FoodCourses(recipeList: state.appetizers,),
                          FoodCourses(recipeList: state.sideDishes,),
                  ],
                );}
                  else if(state is HomeLoading){
                    return Center(child: CircularProgressIndicator(color: AppColors.darkRed,));
                  }
                  else{
                    return Text("Error");
                  }
                  }))])),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(50),topRight:Radius.circular(50)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              onTap:(val){
                setState(() {
                  selectedIndex=val;
                });
              },
                selectedItemColor: AppColors.darkRed,
                unselectedItemColor: Colors.grey,
                currentIndex: selectedIndex,
                type: BottomNavigationBarType.fixed,
                elevation: 15,
                items:[
                  BottomNavigationBarItem(icon:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.home,size:30),
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
      extendBody: true,),

    );
  }
}

