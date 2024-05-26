import 'package:flutter/material.dart';
import 'package:landing/setting/theme.dart';
import 'package:landing/wrapper/device_wrapper.dart';

void main() => runApp(MaterialApp(
      title: "Landing Page",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DeviceWrapper(),
    ));
