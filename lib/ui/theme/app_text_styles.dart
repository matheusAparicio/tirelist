import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tirelist/ui/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle splashScreen = GoogleFonts.prompt(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    letterSpacing: 2.0,
  );

  static TextStyle appBarTitle = GoogleFonts.prompt(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarText,
  );

  static TextStyle componentTitle = GoogleFonts.prompt(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle componentSubtitle = GoogleFonts.prompt(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle componentInfo = GoogleFonts.montserrat(
    fontSize: 16,
    color: AppColors.black,
  );

  static TextStyle tag = GoogleFonts.montserrat(
    fontSize: 12,
    color: AppColors.black,
  );

  static TextStyle pageError = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.black,
  );
}
