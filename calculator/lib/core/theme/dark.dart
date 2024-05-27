import 'package:Calculator/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
      colorScheme: const ColorScheme.dark(
    surface: AppColors.surface,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
  ));
}
