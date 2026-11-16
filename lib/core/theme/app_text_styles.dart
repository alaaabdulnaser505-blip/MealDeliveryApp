
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'PlusJakartaSans';

  static const TextStyle headline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle titleBold=TextStyle(
    fontFamily: fontFamily,
    fontSize: 33,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );

  static const TextStyle bodySmall=TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.5,
    fontWeight: FontWeight.w400,
    color: Colors.white
  );

  static const TextStyle categoryTitle=TextStyle(
      fontFamily: fontFamily,
    fontSize:23,
    fontWeight:FontWeight.w800,
    color:Colors.black
  );

  static const TextStyle viewAllRed=TextStyle(
    fontSize:15,
    fontFamily: fontFamily,
    color:AppColors.lightRed,
    fontWeight:FontWeight.w600
  );

  static const TextStyle dishName=TextStyle(
    fontSize:20,
    fontFamily: fontFamily,
    fontWeight:FontWeight.w700
  );

  static const TextStyle dishDescription=TextStyle(
    fontSize:15,
    color:AppColors.grey,
  );

  static const TextStyle timeText=TextStyle(
    fontFamily:fontFamily,
    fontSize:15.5,
    fontWeight:FontWeight.w600,
    color:Color(0xff565656)
  );
}
