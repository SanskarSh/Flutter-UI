import 'package:flutter/material.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/common_widget/transaction_list.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  const CustomBottomSheet({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height + 150,
          decoration: BoxDecoration(
            color: tertiaryColor.withOpacity(1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(180, 8, 180, 0),
              height: 6,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const TransactionsList(),
            ],
          ),
        ),
      ],
    );
  }
}
