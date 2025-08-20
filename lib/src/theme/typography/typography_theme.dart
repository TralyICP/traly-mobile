import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:package_hook/theme/color/color_scheme.dart';
// import 'package:package_hook/theme/color/color_shades_ext.dart';

class AppTextTheme {
  static TextTheme darkTextTheme = TextTheme(
   displayLarge: TextStyle(
        fontSize: 65.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    displayMedium: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    displaySmall: TextStyle(
        fontSize: 38.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    headlineLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    headlineMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    headlineSmall: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    titleMedium: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    titleSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    labelLarge: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    labelMedium: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily),
    labelSmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.whites,
        fontFamily: GoogleFonts.chakraPetch().fontFamily
),
 );
}
