import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomNumberButton extends StatefulWidget {
  final String number;
  const CustomNumberButton({super.key, required this.number});

  @override
  State<CustomNumberButton> createState() => _CustomNumberButtonState();
}

bool onTaped = false;

class _CustomNumberButtonState extends State<CustomNumberButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTaped = true;
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              onTaped = false;
            });
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
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
          margin: onTaped
              ? const EdgeInsets.fromLTRB(0, 12, 0, 5)
              : const EdgeInsets.fromLTRB(1, 0, 1, 12),
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
              widget.number,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
