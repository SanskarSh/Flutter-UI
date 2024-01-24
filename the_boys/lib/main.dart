import 'package:flutter/material.dart';
import 'package:the_boys/config/routes/app_routes.confg.dart';
import 'package:the_boys/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme().lightTheme,
      darkTheme: MyTheme().darkTheme,
      routerConfig: MyRouter().router,
    );
  }
}
