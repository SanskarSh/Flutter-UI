import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/flutter_secure.dart';
import 'models/provider.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterSecure;
    return ChangeNotifierProvider(
      // create: (context) => CardProvider,
      create: (context) {
        CardProvider();
      },
      child: MaterialApp(
        title: 'Campus Soulmates',
        theme: appTheme(),
        home: const SplashScreen(),
      ),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFEEF1F8),
      primarySwatch: Colors.blue,
      // fontFamily: "Alkatra",
      fontFamily: 'Intel',
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        errorStyle: TextStyle(height: 0),
        border: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        errorBorder: defaultInputBorder,
      ),
      appBarTheme: const AppBarTheme(
        // iconTheme: IconThemeData(color: secondaryColor),
        // backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 1,
        titleTextStyle: TextStyle(
            fontFamily: "Intel",
            // color: secondaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(color: Color(0xFFDEE3F2), width: 1),
);
