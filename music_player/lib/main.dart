import 'package:flutter/material.dart';
import 'package:music_player/src/app.dart';
import 'package:music_player/src/controller/theme_controller.dart';
import 'package:music_player/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
