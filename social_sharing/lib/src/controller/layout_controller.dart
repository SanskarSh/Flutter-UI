import 'package:social_sharing/src/ui/screen/social_sharing_mobile.dart';
import 'package:social_sharing/src/ui/screen/social_sharing_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return SocialSharingMobile();
      } else {
        return const SocialSharingWeb();
      }
    });
  }
}
