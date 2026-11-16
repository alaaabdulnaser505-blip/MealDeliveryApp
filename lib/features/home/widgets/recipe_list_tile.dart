import "package:flutter/material.dart";

import "../../../core/theme/app_text_styles.dart";

class RecipeListTile extends StatelessWidget {

  final String imagePath;
  final String dishName;
  final String dishDescription;
  final String time;
  final double price;
  final double rating;

  const RecipeListTile({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.dishName,
    required this.dishDescription,
    required this.time,
    required this.price,
    required this.rating
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal:width*0.02,vertical:height*0.015),
      padding:EdgeInsets.symmetric(horizontal:width*0.02),
      height: height*0.22,
      width:width*0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 12,
                spreadRadius: 1,
                offset: Offset(0, 3))]),
      child:Row(
        children:[
          Image.asset(imagePath,
              fit:BoxFit.cover,width:width*0.45,height:height*0.18),
          Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                SizedBox(height:height*0.01),
                Text(dishName,style:AppTextStyles.dishName.copyWith(fontSize:18)),
                SizedBox(height:height*0.01),
                Text(dishDescription, maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:AppTextStyles.dishDescription.copyWith(fontSize:16)),
                SizedBox(height:height*0.01),
                Row(
                  children:[
                    Icon(Icons.timer,color:Color(0xff565656),size:18),
                    SizedBox(width:width*0.01),
                    Text(time,style:AppTextStyles.timeText),
                    SizedBox(width:width*0.018),
                    Icon(Icons.circle,color:Color(0xff565656),size:6),
                    SizedBox(width:width*0.013),
                    Icon(Icons.star,color:Color(0xff565656),size:20),
                    SizedBox(width:width*0.007),
                    Text(rating.toString(),style:AppTextStyles.timeText),
                  ]
                ),
                SizedBox(height:height*0.01),
                Text("₹${price}",style:AppTextStyles.viewAllRed)
              ]
            ),
          )
        ]
      )
    );
  }
}

