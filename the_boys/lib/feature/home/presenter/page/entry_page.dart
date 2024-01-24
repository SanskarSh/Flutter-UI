import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_boys/core/utils/rive.dart';
import 'package:the_boys/feature/chat/presenter/page/chat.dart';
import 'package:the_boys/feature/home/data/model/rive_asset.dart';
import 'package:the_boys/feature/home/presenter/widget/animated_bar_indicator.dart';
import 'package:the_boys/feature/profile/presenter/page/profile.dart';
import 'package:the_boys/feature/theBoys/presenter/page/the_Boys_page.dart';
import 'package:vibration/vibration.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});
  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  late final PageController _pageController;
  RiveAsset selectedBottomNav = bottomNav[1];

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodyPages(),
      bottomNavigationBar: animatedNavBar(),
    );
  }

  Widget buildBodyPages() {
    return SizedBox(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        // onPageChanged: onPageChange,
        children: const [
          ChatScreen(),
          TheBoysBtnScreen(),
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
            color: Colors.black.withOpacity(.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ...List.generate(
            bottomNav.length,
            (index) => GestureDetector(
              onTap: () {
                bottomNav[index].input?.change(true);
                if (bottomNav[index] != selectedBottomNav) {
                  onPageChange(index);
                }
                Future.delayed(const Duration(seconds: 1), () {
                  bottomNav[index].input!.change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBarItemIndicator(
                      isActive: bottomNav[index] == selectedBottomNav),
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
