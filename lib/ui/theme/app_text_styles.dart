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

  static TextStyle mainColorTitle = GoogleFonts.prompt(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle mainColorSubtitle = GoogleFonts.prompt(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle mainColorInfo = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.black,
  );

  static TextStyle tag = GoogleFonts.montserrat(
    fontSize: 12,
    color: AppColors.black,
  );

  static TextStyle secondaryColorTitle = GoogleFonts.prompt(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static TextStyle secondaryColorSubtitle = GoogleFonts.prompt(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle secondaryColorInfo = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.white,
  );

  static TextStyle pageError = GoogleFonts.montserrat(
    fontSize: 14,
    color: AppColors.black,
  );
}
