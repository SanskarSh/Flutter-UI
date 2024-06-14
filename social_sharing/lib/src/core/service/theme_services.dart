import 'package:flutter/material.dart';

class SettingService {
  Future<ThemeMode> themeMode() async => ThemeMode.light;

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    // ToDo Save the theme data in shared preferences
  }
}
