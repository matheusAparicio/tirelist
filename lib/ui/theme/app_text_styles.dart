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
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarText,
  );

  static TextStyle pageError = GoogleFonts.prompt(
    fontSize: 25,
    color: AppColors.black,
  );

  static TextStyle componentTitle = GoogleFonts.prompt(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle componentSubtitle = GoogleFonts.prompt(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle componentInfo = GoogleFonts.prompt(
    fontSize: 16,
    color: AppColors.black,
  );
}
