import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'entry_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<double> _animation1;
  late AnimationController _controller2;
  late Animation<double> _animation2;
  late AnimationController _controller3;
  late Animation<double> _animation3;

  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _animation1 = Tween(begin: 0.0, end: 1.0).animate(_controller1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 1), () {
            _controller1.reverse();
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        }
      });

    _controller2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_controller2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 1), () {
            _controller2.reverse();
            _pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        }
      });

    _controller3 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation3 = Tween(begin: 0.0, end: 1.0).animate(_controller3)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 1), () {
            _controller3.reverse();
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        }
      });

    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });

    switch (_currentPageIndex) {
      case 0:
        _controller1.forward();
        _controller2.reverse();
        _controller3.reverse();
        break;
      case 1:
        _controller1.reverse();
        _controller2.forward();
        _controller3.reverse();
        break;
      case 2:
        _controller1.reverse();
        _controller2.reverse();
        _controller3.forward();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              buildPageIndicator(context),
              // const Spacer(),
              const SizedBox(height: 25),
              buildPageView(context),
              const Spacer(flex: 2),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      "Seamless Transactions \n at Your Fingertips!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      // overflow: TextOverflow.visible,
                    )),
              ),

              const Spacer(flex: 3),

              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EntryScreen()));
                      },
                      child: const Text("Get Started",
                          style: TextStyle(color: Colors.white)))),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Have an account?'),
                  TextButton(
                      onPressed: () {},
                      child: Text('Login',
                          style: TextStyle(color: secondaryColor))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildPageView(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: primaryColor),
        color: Colors.transparent,
      ),
      child: PageView(
        controller: _pageController,
        onPageChanged: _handlePageChange,
        children: [
          buildPage('assets/images/onboarding1.png'),
          buildPage('assets/images/onboarding2.png'),
          buildPage('assets/images/onboarding3.png'),
        ],
      ),
    );
  }

  Padding buildPage(url) => Padding(
        padding: const EdgeInsets.all(3),
        child: Image.asset(url, fit: BoxFit.contain),
      );

  Row buildPageIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(0.1),
          width: MediaQuery.of(context).size.width * .29,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4.0),
          ),
          height: 8.0,
          child: AnimatedBuilder(
            animation: _animation1,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation1.value,
                color: Colors.black87,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0.1),
          width: MediaQuery.of(context).size.width * .29,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4.0),
          ),
          height: 8.0,
          child: AnimatedBuilder(
            animation: _animation2,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation2.value,
                color: Colors.black87,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(0.1),
          width: MediaQuery.of(context).size.width * .29,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(4.0),
          ),
          height: 8.0,
          child: AnimatedBuilder(
            animation: _animation3,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation3.value,
                color: Colors.black87,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
              );
            },
          ),
        ),
      ],
    );
  }
}
