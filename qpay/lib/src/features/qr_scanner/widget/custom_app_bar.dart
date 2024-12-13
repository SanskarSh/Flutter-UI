import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),
        child: Icon(
          FontAwesomeIcons.xmark,
          size: 40,
          color: primaryColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 16, 0),
          child: Icon(
            FontAwesomeIcons.bolt,
            size: 30,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
