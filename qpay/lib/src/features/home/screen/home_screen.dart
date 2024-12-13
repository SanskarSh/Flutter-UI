import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/common_widget/custom_bottom_sheet.dart';
import 'package:qpay/src/features/home/widget/custom_app_bar.dart';
import 'package:qpay/local_packages/slimy_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Column buildTopCard() {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          flex: 2,
          child: FittedBox(
            child: Text(
              "Total Balance",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: FittedBox(
            child: Text(
              "\$ 125.00",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Container buildBottomCard() {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.paypal, color: primaryColor),
              Text(
                "Pay",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.circlePlus, color: primaryColor),
              Text(
                "Top-up",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.handHoldingDollar, color: primaryColor),
              Text(
                "Request",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.moneyBillTransfer, color: primaryColor),
              Text(
                "Transfer",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: buildAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            buildCard(constraints),
            const SizedBox(height: 16),
            const CustomBottomSheet(
              title: "Recent Transactions",
            )
          ],
        );
      }),
    );
  }

  Padding buildCard(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SlimyCard(
        width: constraints.maxWidth - 32,
        slimeEnabled: true,
        color: secondaryColor,
        borderRadius: 16,
        topCardHeight: 120,
        topCardWidget: buildTopCard(),
        bottomCardHeight: 100,
        bottomCardWidget: buildBottomCard(),
      ),
    );
  }
}
