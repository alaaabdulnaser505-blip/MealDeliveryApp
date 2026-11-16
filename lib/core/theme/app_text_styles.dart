
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'PlusJakartaSans';

  // Plus Jakarta Sans styles
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

  static const TextStyle titleBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 33,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.5,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle categoryTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 23,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static const TextStyle viewAllRed = TextStyle(
    fontSize: 15,
    fontFamily: fontFamily,
    color: AppColors.brightRed,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle dishName = TextStyle(
    fontSize: 20,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle dishDescription = TextStyle(
    fontSize: 15,
    color: AppColors.blackGrey,
  );

  static const TextStyle timeText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.5,
    fontWeight: FontWeight.w600,
    color: Color(0xff565656),
  );

  // Montserrat styles from dev
  static final TextStyle heading1 = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle heading3 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle devTitle = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle text1 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle text2 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle text3 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle text4 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
