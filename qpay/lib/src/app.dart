import 'package:flutter/material.dart';
import 'package:qpay/src/features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q Pay',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            centerTitle: true, elevation: 0.0, color: Colors.white54),
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
