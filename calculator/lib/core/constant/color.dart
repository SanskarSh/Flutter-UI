import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  // Light Theme Colors
  static const Color surface = Color.fromRGBO(68, 72, 83, 1);
  static const Color primary = Color.fromRGBO(168, 172, 183, 1);
  static const Color onPrimary = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondary = Color.fromRGBO(121, 230, 226, 1);
  static const Color tertiary = Color.fromRGBO(160, 157, 141, 1);

  AppColors({required this.context});

  // Getters for theme-specific colors
  Color get surfaceColor {
    return isDarkTheme(context) ? surface : primary;
  }

  Color get primaryColor {
    return isDarkTheme(context) ? primary : surface;
  }

  Color get onPrimaryColor => onPrimary;

  Color get secondaryColor => secondary;

  Color get tertiaryColor => tertiary;

  static bool isDarkTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
