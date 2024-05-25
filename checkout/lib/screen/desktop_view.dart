import 'package:checkout/component/payment_tile.dart';
import 'package:checkout/component/summary_tile.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.1),
              body: const SingleChildScrollView(child: PaymentTile()),
            ),
          ),
          const Expanded(child: SingleChildScrollView(child: SummaryTile())),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 40,
          ),
          const SizedBox(width: 10),
          const Text(
            "Plus",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Care"),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.3),
          child: const Icon(Icons.person),
        ),
        const SizedBox(width: 10),
        const Row(
          children: [
            Text("John Doe"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
