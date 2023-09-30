import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

// ignore: must_be_immutable
class AnimButton extends StatelessWidget {
  dynamic tapOperation;
  String title;
  AnimButton({
    Key? key,
    required this.tapOperation,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: tapOperation,
      height: 70,
      width: 200,
      text: title,
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      backgroundColor: const Color.fromRGBO(49, 49, 49, 1),
      borderColor: Colors.white30,
      borderRadius: 12,
      borderWidth: 0,
    );
  }
}
