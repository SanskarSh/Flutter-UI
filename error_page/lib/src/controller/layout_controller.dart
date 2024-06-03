import 'package:error_page/src/ui/screen/error_page_mobile.dart';
import 'package:error_page/src/ui/screen/error_page_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return const ErrorPageMobile();
      } else {
        return const ErrorPageWeb();
      }
    });
  }
}
