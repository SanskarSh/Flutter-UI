import 'dart:math';

import 'package:flutter/material.dart';

class AnimateTransition extends StatelessWidget {
  const AnimateTransition({
    super.key,
    required this.tag,
    required this.child,
  });

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (_, animation, __, ___, ____) {
        final rotationAnimation = Tween<double>(
          begin: 0.0,
          end: 0.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.bounceInOut,
        ));

        return AnimatedBuilder(
          animation: rotationAnimation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateZ(rotationAnimation.value * pi),
              alignment: Alignment.centerRight,
              child: child,
            );
          },
          child: child,
        );
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateZ(0),
        alignment: Alignment.centerRight,
        child: child,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.tag, required this.child});

  final String tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateZ(0),
        alignment: Alignment.centerRight,
        child: child,
      ),
    );
  }
}
