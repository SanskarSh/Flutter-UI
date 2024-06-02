import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color surface = Color.fromRGBO(56, 61, 91, 1);
  static const Color primary = Color.fromRGBO(70, 112, 216, 1);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondary = Color.fromRGBO(25, 30, 46, 1);
  static const Color tertiary = Color.fromRGBO(126, 190, 210, 1);

  // Getters for theme-specific colors
  Color get surfaceColor => surface;

  Color get primaryColor => primary;

  Color get onPrimaryColor => onPrimary;

  Color get secondaryColor => secondary;

  Color get tertiaryColor => tertiary;
}
