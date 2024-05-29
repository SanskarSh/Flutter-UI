import 'package:flutter/material.dart';
import 'package:user_profile/src/core/constant/color.dart';

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
    return const TextTheme();
  }
}
