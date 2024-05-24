import 'package:flutter/material.dart';
import 'package:sign_up/mobile/entry_screen_mobile.dart';
import 'package:sign_up/web/entry_screen_web.dart';

class DeviceWrapper extends StatelessWidget {
  const DeviceWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 650) {
        return const MobileEntryScreen();
      } else {
        return const WebEntryScreen();
      }
    });
  }
}
