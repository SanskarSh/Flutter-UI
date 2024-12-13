import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),
      child: IconButton(
        icon: Icon(
          FontAwesomeIcons.userCircle,
          size: 40,
          color: tertiaryColor,
        ),
        onPressed: () {},
      ),
    ),
    title: Column(
      children: [
        Text(
          "Hello, Hiday!",
          style: TextStyle(
            color: tertiaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Have a great day!",
          style: TextStyle(
              color: tertiaryColor, fontSize: 16, fontWeight: FontWeight.w300),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 16, 0),
        child: IconButton(
          icon: Icon(
            FontAwesomeIcons.bell,
            size: 30,
            color: tertiaryColor,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
