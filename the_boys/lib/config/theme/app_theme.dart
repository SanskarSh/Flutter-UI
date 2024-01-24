import 'package:flutter/material.dart';

class MyTheme {
  ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: Color(0xffe5e5e5),
      primary: Color.fromRGBO(49, 49, 49, 1),
    ),
  );
  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      background: Color.fromRGBO(49, 49, 49, 1),
      primary: Color(0xffe5e5e5),
    ),
  );
}
