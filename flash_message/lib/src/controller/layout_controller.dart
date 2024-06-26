import 'package:flash_message/src/ui/screen/flash_message_mobile.dart';
import 'package:flash_message/src/ui/screen/flash_message_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return const FlashMessageMobile();
      } else {
        return const FlashMessageWeb();
      }
    });
  }
}
