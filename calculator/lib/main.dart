import 'package:Calculator/controller/responsive_layout.dart';
import 'package:Calculator/core/theme/dark.dart';
import 'package:Calculator/core/theme/light.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Calculator",
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(),
        darkTheme: getDarkTheme(),
        themeMode: ThemeMode.dark,
        home: const ResponsiveLayout(),
      ),
    );
