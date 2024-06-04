import 'package:flutter/material.dart';
import 'package:music_player/src/core/constant/color.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: AppColors.surface,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
    ),
    // textTheme: buildTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      surface: AppColors.surface,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
    ),
    // textTheme: buildTextTheme(),
  );

  // static TextTheme buildTextTheme() {
  //   return TextTheme(
  //     displayLarge:,
  //     displayMedium:,
  //     displaySmall:
  //   );
  // }
}
