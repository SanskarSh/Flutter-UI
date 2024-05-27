import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomNumberButton extends StatelessWidget {
  final String number;
  const CustomNumberButton({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.4),
            blurRadius: 5,
            spreadRadius: .5,
            inset: true,
            offset: const Offset(0, -15),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(1, 0, 1, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.1),
              Colors.black.withOpacity(.1),
              Theme.of(context).colorScheme.primary.withOpacity(.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FittedBox(
          child: Text(
            number,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
