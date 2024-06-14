import 'package:flutter/material.dart';

class AppColors {
  final BuildContext context;

  // Light Theme Colors
  static const Color surface = Color.fromRGBO(255, 255, 255, 1);
  static const Color primary = Color.fromRGBO(0, 0, 0, 1);
  static const Color secondary = Color.fromRGBO(121, 230, 226, 1);

  AppColors({required this.context});

  // Getters for theme-specific colors
  Color get surfaceColor => surface;

  Color get primaryColor => primary;

  Color get secondaryColor => secondary;
}
