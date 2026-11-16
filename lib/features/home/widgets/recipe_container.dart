import "package:flutter/material.dart";

import "../../../core/theme/app_text_styles.dart";

class RecipeContainer extends StatelessWidget {
  const RecipeContainer({
    super.key,
    required this.height,
    required this.width,
    required this.dishName,
    required this.dishDescription,
    required this.time,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.ontap
  });

  final String dishName;
  final double height;
  final double width;
  final String dishDescription;
  final String time;
  final double price;
  final String imagePath;
  final double rating;
  final Function() ontap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin:EdgeInsets.symmetric(horizontal:width*0.02),
            height: height*0.33,
            width:width*0.6,
            decoration: BoxDecoration(
                color:Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: Offset(0, 3))
                ],
                borderRadius: BorderRadius.circular(20)
            ),
            child:Padding(
              padding:EdgeInsets.symmetric(horizontal:width*0.03),
              child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:[
                    Image.asset(imagePath,
                    fit:BoxFit.cover,width:width*0.5,height:height*0.18),
                    SizedBox(height:height*0.001),
                    Text(dishName,style:AppTextStyles.dishName),
                    SizedBox(height:height*0.002),
                    Text(dishDescription, maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:AppTextStyles.dishDescription),
                    SizedBox(height:height*0.001),
                    Row(
                        children:[
                          Icon(Icons.timer,
                              color:Color(0xff565656),
                              size:18),
                          SizedBox(width:width*0.01),
                          Text(time,style:AppTextStyles.timeText),
                          SizedBox(width:width*0.018),
                          Icon(Icons.circle,color:Color(0xff565656),size:6),
                          SizedBox(width:width*0.013),
                          Icon(Icons.star,color:Color(0xff565656),size:20),
                          SizedBox(width:width*0.007),
                          Text(rating.toString(),style:AppTextStyles.timeText)]),
                    SizedBox(height:height*0.014),
                    Text("₹${price}",style:AppTextStyles.viewAllRed)
                  ]
              ),
            )
        ),
        onTap:(){
          ontap();
          //Get redirected to Dish Page
        }
    );
  }
}

