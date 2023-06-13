import 'package:flutter/material.dart';

import '../constants.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: buildBodyPages(),
      bottomNavigationBar: buildNavBar(),
    );
  }

  SizedBox buildBodyPages() => SizedBox(
          child: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ));

  SafeArea buildNavBar() => SafeArea(
          child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))),
        child: Row(),
      ));
}
