import 'package:flutter/material.dart';
import 'package:smart_room/src/app.dart';
import 'package:smart_room/src/controller/theme_controller.dart';
import 'package:smart_room/src/core/service/theme_services.dart';

void main() async {
  final settingsController = SettingsController(SettingService());
  await settingsController.loadSettings();
  runApp(MyApp(controller: settingsController));
}
