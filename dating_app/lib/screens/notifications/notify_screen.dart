import 'package:flutter/material.dart';

import '../../config.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({super.key});

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 15,
            color: backgroundColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
