import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  // Light Theme Colors
  static const Color surface = Colors.white;
  static const Color primary = Color.fromRGBO(14, 86, 241, 1);
  static const Color secondary = Color.fromRGBO(230, 170, 81, 1);
  static const Color tertiary = Colors.black;

  AppColors({required this.context});

  // Getters for theme-specific colors
  Color get surfaceColor {
    return isDarkTheme(context) ? const Color.fromARGB(255, 88, 83, 83) : primary;
  }

  Color get primaryColor => primary;

  Color get secondaryColor => secondary;

  Color get tertiaryColor => tertiary;

  static bool isDarkTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
