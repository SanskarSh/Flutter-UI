import 'package:checkout/screen/desktop_view.dart';
import 'package:checkout/screen/mobile_view.dart';
import 'package:flutter/material.dart';

class DeviceWrapper extends StatelessWidget {
  const DeviceWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 750) {
        return const MobileView();
      } else {
        return const DesktopView();
      }
    });
  }
}
