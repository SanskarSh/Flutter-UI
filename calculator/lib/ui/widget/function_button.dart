import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomFunctionButton extends StatefulWidget {
  final String funText;
  final bool isActionBtn;
  final bool isActionBtnBig;
  const CustomFunctionButton({
    super.key,
    required this.funText,
    this.isActionBtn = false,
    this.isActionBtnBig = false,
  });

  @override
  State<CustomFunctionButton> createState() => _CustomFunctionButtonState();
}

bool onTaped = false;

class _CustomFunctionButtonState extends State<CustomFunctionButton> {
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
        height: widget.isActionBtnBig ? 120 : 50,
        width: widget.isActionBtnBig ? null : 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            BoxShadow(
              color: widget.isActionBtn
                  ? Theme.of(context).colorScheme.secondary.withOpacity(.6)
                  : Theme.of(context).colorScheme.primary.withOpacity(.6),
              blurRadius: 5,
              spreadRadius: .5,
              inset: true,
              offset: const Offset(0, -15),
            )
          ],
        ),
        child: Container(
          margin: onTaped
              ? const EdgeInsets.only(top: 6, bottom: 3)
              : const EdgeInsets.only(bottom: 9),
          decoration: BoxDecoration(
            borderRadius: widget.isActionBtnBig
                ? BorderRadius.circular(23)
                : BorderRadius.circular(80),
            color: widget.isActionBtn
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                widget.funText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
