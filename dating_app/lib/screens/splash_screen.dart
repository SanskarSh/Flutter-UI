import 'dart:ui';

import 'package:dating_app/screens/entry_screen.dart';
import 'package:dating_app/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../config.dart';
// import '../main.dart';
import '../models/flutter_secure.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () async {
      (await FlutterSecure().getValue()).isEmpty == true
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OnboardingScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const EntryScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeInfo.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 100,
            bottom: 200,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          Positioned(
            top: SizeInfo.screenHeight * .15,
            width: SizeInfo.screenWidth * .5,
            right: SizeInfo.screenWidth * .25,
            child: Card(
              elevation: 10,
              color: Colors.white70,
              child: SizedBox(
                height: SizeInfo.screenWidth * .5,
                child: const Center(
                    child: Icon(
                  Icons.local_fire_department_rounded,
                  size: 100,
                  color: backgroundColor2,
                )),
              ),
            ),
          ),
          Positioned(
            bottom: SizeInfo.screenHeight * .15,
            width: SizeInfo.screenWidth,
            // left: SizeInfo.screenWidth * .05,
            // height: SizeInfo.screenHeight * .06,
            child: const Text(
              "Campus Soulmates",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: backgroundColor2,
                // letterSpacing: 1,
                fontFamily: "Poppins",
                fontSize: 18,
                // color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
