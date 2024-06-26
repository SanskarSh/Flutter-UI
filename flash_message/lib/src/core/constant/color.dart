import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  // Light Theme Colors
  static const Color surface = Color.fromRGBO(245, 245, 245, 1);
  static const Color surfaceDark = Color.fromRGBO(10, 10, 10, 1);

  static const Color primary = Color.fromRGBO(0, 0, 0, 1);
  static const Color primaryDark = Color.fromRGBO(255, 255, 255, 1);

  static const Color secondary = Color.fromRGBO(121, 230, 226, 1);

  static const Color tertiary = Color.fromRGBO(160, 157, 141, 1);

  AppColors({required this.context});

  // Getters for theme-specific colors
  Color get surfaceColor => isDarkTheme(context) ? surfaceDark : surface;

  Color get primaryColor => isDarkTheme(context) ? primaryDark : primary;

  Color get onPrimaryColor =>
      isDarkTheme(context) ? Colors.black : Colors.white;

  Color get secondaryColor => secondary;

  Color get tertiaryColor => tertiary;

  Brightness get brightness =>
      isDarkTheme(context) ? Brightness.dark : Brightness.light;

  static bool isDarkTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
