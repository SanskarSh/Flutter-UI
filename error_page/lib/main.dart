import 'package:flutter/material.dart';
import 'package:error_page/src/app.dart';
import 'package:error_page/src/controller/theme_controller.dart';
import 'package:error_page/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
