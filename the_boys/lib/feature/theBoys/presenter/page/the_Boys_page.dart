import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

class TheBoysBtnScreen extends StatefulWidget {
  const TheBoysBtnScreen({super.key});

  @override
  State<TheBoysBtnScreen> createState() => _TheBoysBtnScreenState();
}

class _TheBoysBtnScreenState extends State<TheBoysBtnScreen> {
  SMITrigger? button;
  StateMachineController getController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          button?.value = true;
          setState(() {
            Vibration.hasVibrator()
                .then((value) => Vibration.vibrate(duration: 50));
          });
        },
        child: RiveAnimation.asset(
          'assets/rive/the_boys_button.riv',
          onInit: ((artboard) {
            StateMachineController cont = getController(artboard);
            cont.isActive = false;
            button = cont.findSMI('Clicked');
            button!.value = false;
          }),
        ),
      ),
    );
  }
}
