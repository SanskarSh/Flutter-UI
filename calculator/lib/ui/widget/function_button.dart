import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomFunctionButton extends StatelessWidget {
  final String funText;
  const CustomFunctionButton({super.key, required this.funText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(.6),
            blurRadius: 5,
            spreadRadius: .5,
            inset: true,
            offset: const Offset(0, -15),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primary,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.black.withOpacity(.1),
          //     Colors.black.withOpacity(.1),
          //     Theme.of(context).colorScheme.primary.withOpacity(.1),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: FittedBox(
          child: Text(
            funText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
