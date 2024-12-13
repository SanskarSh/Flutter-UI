import 'package:flutter/material.dart';
import 'package:ticket_machine/src/app.dart';
import 'package:ticket_machine/src/controller/theme_controller.dart';
import 'package:ticket_machine/src/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(MyApp(controller: DependencyInjection.getIt<SettingsController>()));
}
