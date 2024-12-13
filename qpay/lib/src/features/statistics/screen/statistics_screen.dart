import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/common_widget/custom_bottom_sheet.dart';
import 'package:qpay/src/features/statistics/widget/bar_chart.dart';
import 'package:qpay/src/features/statistics/widget/cat_cart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Statistics',
          style: TextStyle(
            color: tertiaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: buildStats(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoryCards
                  .map((card) => BuildCatCard(
                        category: card['category'],
                        amount: card['amount'],
                        percentage: card['percentage'],
                        icon: card['icon'],
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          const CustomBottomSheet(
            title: "Your Transactions",
          ),
        ],
      ),
    );
  }

  Column buildStats() {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  'Total Expanses',
                  style: TextStyle(
                    color: tertiaryColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$92,82',
                  style: TextStyle(
                    color: tertiaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Card(
              color: tertiaryColor.withOpacity(.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 2),
                    Text(
                      'This Week',
                      style: TextStyle(
                        color: tertiaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      FontAwesomeIcons.chevronDown,
                      color: tertiaryColor,
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        const BarChart(),
        const SizedBox(height: 16),
      ],
    );
  }
}
