import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      surface: Color.fromRGBO(68, 72, 83, 1),
      primary: Color.fromRGBO(168, 172, 183, 1),
      onPrimary: Color.fromRGBO(255, 255, 255, 1),
      secondary: Color.fromRGBO(121, 230, 226, 1),
      tertiary: Color.fromRGBO(160, 157, 141, 1),
    ),
  );
}
