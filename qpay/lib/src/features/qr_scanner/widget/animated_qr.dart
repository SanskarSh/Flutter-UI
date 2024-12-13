import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';

class AnimatedQR extends StatefulWidget {
  const AnimatedQR({
    super.key,
  });

  @override
  State<AnimatedQR> createState() => _AnimatedQRState();
}

class _AnimatedQRState extends State<AnimatedQR>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Icon(
            FontAwesomeIcons.qrcode,
            size: _animation.value,
            color: primaryColor,
          );
        },
      ),
    );
  }
}
