import "package:flutter/material.dart";
import "package:tripora/features/home/widgets/recipe_list_tile.dart";
import "../../../core/models/recipe_model.dart";

class FoodCourses extends StatelessWidget {
  final List<RecipeModel> recipeList;
  const FoodCourses({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: recipeList.length,
              itemBuilder: (context, i) {
                return RecipeListTile(
                    height: height,
                    width: width,
                    imagePath: recipeList[i].imagePath,
                    dishName: recipeList[i].dishName,
                    dishDescription: recipeList[i].dishDescription,
                    time: recipeList[i].time,
                    price: recipeList[i].price,
                    rating: recipeList[i].rating);
              }
          );
  }
}
