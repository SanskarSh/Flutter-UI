import 'package:flutter/material.dart';
import 'package:user_profile/src/controller/theme_controller.dart';
import 'package:user_profile/src/core/theme/theme.dart';
import 'package:user_profile/src/controller/layout_controller.dart';

class MyApp extends StatelessWidget {
  final SettingsController controller;

  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          themeMode: controller.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          home: const ResponsiveLayout(),
        );
      },
    );
  }
}
