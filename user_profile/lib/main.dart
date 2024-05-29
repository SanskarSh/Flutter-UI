import 'package:flutter/material.dart';
import 'package:user_profile/src/app.dart';
import 'package:user_profile/src/controller/theme_controller.dart';
import 'package:user_profile/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
