import 'package:flutter/material.dart';
import 'package:the_boys/feature/presenter/pages/home/chat/chat.dart';
import 'package:the_boys/feature/presenter/pages/home/the_boys/home.dart';
import 'package:the_boys/feature/presenter/pages/home/profile/profile.dart';
import 'package:vibration/vibration.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  late PageController _pageController;
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      bottomNavigationBar: buildBottomNavBar(),
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ChatScreen(),
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }

  onPageChange(int index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.animateToPage(index,
          curve: Curves.easeInOut, duration: const Duration(milliseconds: 250));
      Vibration.hasVibrator().then((value) => Vibration.vibrate(duration: 50));
    });
  }

  SafeArea buildBottomNavBar() => SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
          decoration: BoxDecoration(
              // color: Colors.black.withOpacity(.8),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.6)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () => onPageChange(0),
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()
                    ..scale(_currentPageIndex == 0 ? 1.1 : 1.0),
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color:
                        _currentPageIndex == 0 ? Colors.white : Colors.white38,
                  ),
                ),
                color: _currentPageIndex == 0 ? Colors.white : Colors.white38,
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () => onPageChange(1),
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()
                    ..scale(_currentPageIndex == 1 ? 1.1 : 1.0),
                  child: Icon(
                    Icons.home_outlined,
                    color:
                        _currentPageIndex == 1 ? Colors.white : Colors.white38,
                  ),
                ),
                color: _currentPageIndex == 1 ? Colors.white : Colors.white38,
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: () => onPageChange(2),
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()
                    ..scale(_currentPageIndex == 2 ? 1.1 : 1.0),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color:
                        _currentPageIndex == 2 ? Colors.white : Colors.white38,
                  ),
                ),
                color: _currentPageIndex == 2 ? Colors.white : Colors.white38,
              ),
            ],
          ),
        ),
      );
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
