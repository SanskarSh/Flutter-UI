import 'package:flutter/material.dart';
import 'package:error_page/src/controller/theme_controller.dart';

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({super.key, required this.controller});

  final SettingsController controller;

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

bool _switch = false;

class _ToggleThemeState extends State<ToggleTheme> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _switch = !_switch;
          widget.controller
              .updateThemeMode(_switch ? ThemeMode.dark : ThemeMode.light);
        });
      },
      icon:
          _switch ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
    );
  }
}
