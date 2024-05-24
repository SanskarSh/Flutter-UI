import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:sign_up/component/register_drawer.dart';
import 'package:sign_up/component/login_drawer.dart';

class MobileEntryScreen extends StatefulWidget {
  const MobileEntryScreen({super.key});

  @override
  State<MobileEntryScreen> createState() => _MobileEntryScreenState();
}

class _MobileEntryScreenState extends State<MobileEntryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSignIn = false;

  void onSignIn() {
    setState(() {
      isSignIn = true;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  void onRegister() {
    setState(() {
      isSignIn = false;
    });
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(37, 58, 66, 1),
      drawer: isSignIn ? const LoginDrawer() : const RegisterDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Background image.avif',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(37, 58, 66, .9),
          ),
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset('assets/images/Logo.png')),
                  const Spacer(flex: 2),
                  const Padding(
                    padding: EdgeInsets.only(right: 100),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            child: Text(
                              'Welcome to\nthe best source\nof football',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox.square(dimension: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            child: Text(
                              'No longer missing news from\nyour favorite club',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.greenAccent[700],
                      ),
                      onPressed: onSignIn,
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        foregroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: onRegister,
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2)
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
