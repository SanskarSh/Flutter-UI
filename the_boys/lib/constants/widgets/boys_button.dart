import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

class TheBoysBtn extends StatefulWidget {
  const TheBoysBtn({super.key});

  @override
  State<TheBoysBtn> createState() => _TheBoysBtnState();
}

class _TheBoysBtnState extends State<TheBoysBtn> {
  SMITrigger? button;
  StateMachineController getController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        button?.value = true;
        setState(() {
          Vibration.hasVibrator()
              .then((value) => Vibration.vibrate(duration: 50));
        });
      },
      child: RiveAnimation.asset(
        'assets/the_boys_button.riv',
        onInit: ((artboard) {
          StateMachineController cont = getController(artboard);
          cont.isActive = false;
          button = cont.findSMI('Clicked');
          button!.value = false;
        }),
      ),
    );
  }
}
