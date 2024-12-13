import 'package:flutter/material.dart';

class TicketMachineWeb extends StatelessWidget {
  const TicketMachineWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // body: Center(
      //   child: Transform.translate(
      //     offset: const Offset(0, 300),
      //     child: Transform(
      //       alignment: Alignment.center,
      //       transform: Matrix4.identity()
      //         ..rotateZ(-3.14 / 2)
      //         ..scale(.4),
      //       child: const BuildCard(),
      //     ),
      //   ),
      // ),
    );
  }
}
