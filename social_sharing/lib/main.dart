import 'package:flutter/material.dart';
import 'package:social_sharing/src/app.dart';
import 'package:social_sharing/src/controller/theme_controller.dart';
import 'package:social_sharing/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
