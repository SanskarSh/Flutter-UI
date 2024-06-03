import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  // Light Theme Colors
  static const Color surface = Color.fromRGBO(246, 246, 246, 1);
  static const Color primary = Color.fromRGBO(57, 78, 64, 1);
  static const Color secondary = Color.fromRGBO(240, 242, 241, 1);
  static const Color tertiary = Colors.black;

  AppColors({required this.context});

  // Getters for theme-specific colors
  Color get surfaceColor {
    return isDarkTheme(context) ? surface : Colors.teal.shade200;
  }

  Color get primaryColor => primary;

  Color get secondaryColor => secondary;

  Color get tertiaryColor => tertiary;

  static bool isDarkTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
