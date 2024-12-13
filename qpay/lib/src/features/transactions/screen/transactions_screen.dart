import 'package:flutter/material.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/common_widget/custom_bottom_sheet.dart';
import 'package:qpay/src/features/transactions/widget/balance_card.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Your Transactions",
                style: TextStyle(
                  color: tertiaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const BalanceCard(),
          const SizedBox(height: 64),
          const CustomBottomSheet(
            title: "",
          ),
        ],
      ),
    );
  }
}
