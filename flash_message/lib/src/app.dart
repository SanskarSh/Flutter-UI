import 'package:flutter/material.dart';
import 'package:flash_message/src/controller/theme_controller.dart';
import 'package:flash_message/src/core/theme/theme.dart';
import 'package:flash_message/src/controller/layout_controller.dart';

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
          theme: MyTheme.appTheme(context),
          home: const ResponsiveLayout(),
        );
      },
    );
  }
}
