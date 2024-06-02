import 'package:smart_room/src/ui/screen/smart_room_mobile.dart';
import 'package:smart_room/src/ui/screen/smart_room_tablet.dart';
import 'package:smart_room/src/ui/screen/smart_room_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const SmartRoomMobile();
      }
      if (constraints.maxWidth >= 500 && constraints.maxWidth < 1100) {
        return const SmartRoomTablet();
      } else {
        return const SmartRoomWeb();
      }
    });
  }
}
