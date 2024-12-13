import 'package:flutter/material.dart';
import 'package:ticket_machine/src/controller/theme_controller.dart';

class ToggleTheme extends StatefulWidget {
  const ToggleTheme({super.key, required this.controller});

  final SettingsController controller;

  @override
  State<ToggleTheme> createState() => _ToggleThemeState();
}

class _ToggleThemeState extends State<ToggleTheme> {
  late bool _switch;

  @override
  void initState() {
    super.initState();
    _switch = widget.controller.themeMode == ThemeMode.dark;
  }

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
      icon: _switch
          ? const Icon(
              Icons.dark_mode,
              color: Colors.amber,
            )
          : const Icon(
              Icons.light_mode,
              color: Colors.amber,
            ),
    );
  }
}
