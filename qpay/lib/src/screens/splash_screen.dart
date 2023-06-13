import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const OnboardingScreen(),
      splash: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/logo.png')),
            const Text("  Qpay", style: displayLarge)
          ],
        ),
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: primaryColor,
    );
  }
}
