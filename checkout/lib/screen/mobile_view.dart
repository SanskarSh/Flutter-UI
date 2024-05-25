import 'package:checkout/component/payment_tile.dart';
import 'package:checkout/component/summary_tile.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/Logo.png",
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
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.1),
              body: const PaymentTile(),
            ),
          ),
          const SummaryTile()
        ],
      ),
    );
  }
}
