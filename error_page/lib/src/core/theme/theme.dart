import 'package:flutter/material.dart';
import 'package:error_page/src/core/constant/color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: AppColors.surface,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
    ),
    textTheme: buildTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
      ),
      textTheme: buildTextTheme());

  static TextTheme buildTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.merriweather(
        fontSize: 32,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.merriweather(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.surface,
      ),
      displaySmall: GoogleFonts.merriweather(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
