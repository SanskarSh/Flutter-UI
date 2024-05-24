import 'package:flutter/material.dart';
import 'package:sign_up/wrapper/responsive_layout.dart';

void main() => runApp(MaterialApp(
      title: "Sign Up",
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DeviceWrapper(),
    ));
