import 'package:flutter/material.dart';
import 'package:flash_message/src/app.dart';
import 'package:flash_message/src/controller/theme_controller.dart';
import 'package:flash_message/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
