import 'package:Calculator/ui/screen/calculator_mobile.dart';
import 'package:Calculator/ui/screen/calculator_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return const CalculatorMobile();
      } else {
        return const CalculatorWeb();
      }
    });
  }
}
