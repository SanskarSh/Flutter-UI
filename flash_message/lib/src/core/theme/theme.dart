import 'package:flutter/material.dart';
import 'package:flash_message/src/core/constant/color.dart';

class MyTheme {
  final BuildContext context;
  MyTheme._(this.context);

  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: AppColors(context: context).brightness,
        // 
        surface: AppColors(context: context).surfaceColor,
        onSurface: Colors.black,
        //
        primary: AppColors(context: context).primaryColor,
        onPrimary: AppColors(context: context).onPrimaryColor,
        //
        secondary: AppColors(context: context).secondaryColor,
        onSecondary: Colors.black,
        //
        error: Colors.red,
        onError: Colors.white,
      ),
      // textTheme: buildTextTheme(),
    );
  }

  // static TextTheme buildTextTheme() {
  //   return TextTheme(
  //     displayLarge:,
  //     displayMedium:,
  //     displaySmall:
  //   );
  // }
}
