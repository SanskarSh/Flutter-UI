import 'package:user_profile/src/ui/screen/user_profile_mobile.dart';
import 'package:user_profile/src/ui/screen/user_profile_tablet.dart';
import 'package:user_profile/src/ui/screen/user_profile_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 520) {
        return const UserProfileMobile();
      }
      if (constraints.maxWidth > 510 && constraints.maxWidth < 1040) {
        return const UserProfileTablet();
      } else {
        return const UserProfileWeb();
      }
    });
  }
}
