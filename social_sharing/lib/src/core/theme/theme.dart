import 'package:flutter/material.dart';
import 'package:social_sharing/src/core/constant/color.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: AppColors.surface,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    // textTheme: buildTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      surface: AppColors.surface,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
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
