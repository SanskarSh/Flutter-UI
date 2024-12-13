import 'package:ticket_machine/src/ui/screen/ticket_machine_mobile.dart';
import 'package:ticket_machine/src/ui/screen/ticket_machine_web.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return const TicketMachineMobile();
      } else {
        return const TicketMachineWeb();
      }
    });
  }
}
