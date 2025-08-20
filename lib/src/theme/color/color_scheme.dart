import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primary = MaterialColor(0xFF380F7C, {
    50: Color(0xFFEDE7F6),
    100: Color(0xFFD1C4E9),
    200: Color(0xFFB39DDB),
    300: Color(0xFF9575CD),
    400: Color(0xFF7B2FF7),
    500: Color(0xFF380F7C), // Base color
    600: Color(0xFF8A2BE2),
    700: Color(0xFF38076C),
    800: Color(0xFF15093C),
    900: Color(0xFF070F3B),
  });

  // Secondary color (Teal) shades
  static const MaterialColor secondary = MaterialColor(0xFFF107A3, {
    50: Color(0xFFFFE4F3),
    100: Color(0xFFFFBDE5),
    200: Color(0xFFFF94D6),
    300: Color(0xFFFF6BC7),
    400: Color(0xFFED30E7),
    500: Color(0xFFF107A3), // Base color
    600: Color(0xFFD10692),
    700: Color(0xFFB00580),
    800: Color(0xFF8E046D),
    900: Color(0xFF6E035A),
  });
  // Gray shades
  static const MaterialColor gray = MaterialColor(0xFF9E9E9E, {
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    150: Color(0xFFF0F0F0),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111113),
  });

  // Whites (various off-white shades)
  static const MaterialColor whites = MaterialColor(0xFFFFFFFF, {
    50: Color(0xFFFFFFFF), // Normal white
    100: Color(0xFFF3F4F6), // Nav background
    200: Color(0xFFFDFDFD), // Background.
    300: Color(0XFF121212),
    400: Color(0XFF1C2128)
  });

  static const MaterialColor yellow = MaterialColor(0xFFFDE047, {
    500: Color(0xFFFDE047), // Base color
  });
}
