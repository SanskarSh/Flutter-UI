import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/entry/data/navigation.dart';

class CustomNavBar extends StatelessWidget {
  final Function(int) _onNavTap;
  final int _activeIndex;

  const CustomNavBar(
      {super.key, required Function(int) onNavTap, required activeIndex})
      : _onNavTap = onNavTap,
        _activeIndex = activeIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SafeArea(
        child: CircleNavBar(
          activeIndex: _activeIndex,
          onTap: _onNavTap,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
          circleColor: secondaryColor,
          activeIcons: navigationItems
              .map(
                (item) => Center(
                  child: FaIcon(
                    item.activeIcon,
                    color: primaryColor,
                    size: 25.0,
                  ),
                ),
              )
              .toList(),
          inactiveIcons: navigationItems
              .map(
                (item) => FaIcon(
                  item.inactiveIcon,
                  color: tertiaryColor,
                ),
              )
              .toList(),
          color: primaryColor,
        ),
      ),
    );
  }
}
