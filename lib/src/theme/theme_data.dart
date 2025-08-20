import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traly/src/theme/color/color_scheme.dart';
import 'package:traly/src/theme/color/color_shades_ext.dart';
import 'package:traly/src/theme/typography/typography_theme.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.black,
      secondary: AppColors.secondary,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: AppColors.gray.p800,
      onSurface: AppColors.whites.p200,
    ),
    textTheme: AppTextTheme.darkTextTheme,
    useMaterial3: true,
    fontFamily: GoogleFonts.chakraPetch().fontFamily,
    // Scaffold background
    scaffoldBackgroundColor: AppColors.whites.p300,

    splashFactory: NoSplash.splashFactory,
    // AppBar styling
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whites.p300,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.gray.p50),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.gray.p50,
      ),
    ),

    // Card styling
    cardTheme: CardThemeData(
      color: AppColors.whites.p400,
      shadowColor: AppColors.gray.p600,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),

    // Drawer theme
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.whites.p400,
      surfaceTintColor: Colors.transparent,
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(342.w, 48.h),
        minimumSize: Size(342.w, 48.h),
        splashFactory: NoSplash.splashFactory,
        foregroundColor: AppColors.whites,
        backgroundColor: Colors.transparent,
        elevation: 1,
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(56.r)),
        textStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.whites,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Input Decoration Theme (TextFields)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.gray.p50),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.gray.p50, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      hintStyle: TextStyle(
        color: AppColors.gray.shade600,
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whites.withOpacity(.2),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.whites.withOpacity(.1),
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
    ),

    // Canvas color (for dialogs, modals)
    canvasColor: AppColors.whites.p400,
  );
}
