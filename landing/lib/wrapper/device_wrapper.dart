import 'package:flutter/material.dart';
import 'package:landing/screen/mobile_view.dart';
import 'package:landing/screen/web_view.dart';

class DeviceWrapper extends StatelessWidget {
  const DeviceWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return const MobileView();
      } else {
        return const WebView();
      }
    });
  }
}
