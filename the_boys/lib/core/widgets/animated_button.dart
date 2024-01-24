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
      transitionType: TransitionType.LEFT_TO_RIGHT,
      borderRadius: 12,
      borderWidth: 0,
      borderColor: Theme.of(context).colorScheme.background,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 24,
      ),
      selectedTextColor: Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedBackgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
