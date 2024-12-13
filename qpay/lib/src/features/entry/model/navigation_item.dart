import 'package:flutter/material.dart';

class NavigationItem {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final Widget page;

  const NavigationItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.page,
  });
}
