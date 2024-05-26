import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: Color.fromRGBO(255, 255, 255, 1),
      primary: Color.fromRGBO(208, 98, 55, 1),
      secondary: Color.fromRGBO(54, 54, 54, 1),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
    surface: Color.fromRGBO(54, 54, 54, 1),
    primary: Color.fromRGBO(208, 98, 55, 1),
    secondary: Color.fromRGBO(255, 255, 255, 1),
  ));
}
