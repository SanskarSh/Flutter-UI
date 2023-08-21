import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:vibration/vibration.dart';

import '../config.dart';
import '../models/rive_asset.dart';
import '../utils/rive_utils.dart';
import '../components/animated_bar.dart';
import 'chat/chat_screen.dart';
import 'home/home_screen.dart';
import 'notifications/notify_screen.dart';
import 'profile/profile_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  final PageController _pageController = PageController();
  // int selectedPage = 0;
  // RiveAsset selectedBottomNav = bottomNav[2];
  RiveAsset selectedBottomNav = bottomNav.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: buildBodyPages(),
      bottomNavigationBar: animatedNavBar(),
    );
  }

  Widget buildBodyPages() {
    return SizedBox(
      // height: SizeInfo.screenHeight,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        // onPageChanged: (index) {
        //   onPageChange(index);
        // },
        children: const [
          HomeScreen(),
          ChatScreen(),
          NotifyScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  onPageChange(int index) {
    setState(() {
      _pageController.animateToPage(index,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
      selectedBottomNav = bottomNav[index];
      Vibration.hasVibrator().then((value) => Vibration.vibrate(duration: 50));
    });
  }

  SafeArea animatedNavBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ...List.generate(
            bottomNav.length,
            (index) => GestureDetector(
              onTap: () {
                bottomNav[index].input!.change(true);
                if (bottomNav[index] != selectedBottomNav) {
                  // setState(() {
                  //   selectedBottomNav = bottomNav[index];
                  // });
                  onPageChange(index);
                }
                Future.delayed(const Duration(seconds: 1), () {
                  bottomNav[index].input!.change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: bottomNav[index] == selectedBottomNav),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: bottomNav[index] == selectedBottomNav ? 1 : .5,
                      child: RiveAnimation.asset(
                        bottomNav.first.src,
                        artboard: bottomNav[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller =
                              RiveUtils.getRiveController(artboard,
                                  stateMachineName:
                                      bottomNav[index].stateMachine);
                          bottomNav[index].input =
                              controller.findSMI("active") as SMIBool;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
