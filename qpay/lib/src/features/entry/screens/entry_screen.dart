import 'package:flutter/material.dart';
import 'package:qpay/src/features/entry/data/navigation.dart';
import 'package:qpay/src/features/entry/widget/custom_nav_bar.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _activeIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() => _activeIndex = index);
  }

  void _onNavTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // PageView that takes full screen
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            children: navigationItems.map((item) => item.page).toList(),
          ),
          // Navigation bar
          CustomNavBar(onNavTap: _onNavTap, activeIndex: _activeIndex)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
