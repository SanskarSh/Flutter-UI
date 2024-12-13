import 'package:flutter/material.dart';
import 'package:ticket_machine/src/ui/widget/custome_animate_transition.dart';
import 'package:ticket_machine/src/ui/widget/custom_bank_card.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({
    super.key,
    required this.bankName,
    required this.cardType,
    required this.cvv,
    required this.colors,
  });

  final String bankName;
  final String cardType;
  final String cvv;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Material(
                color: Colors.transparent,
                child: SecondPage(
                  tag: cvv,
                  child: CustomBackCard(
                    bankName: bankName,
                    cardType: cardType,
                    cvv: cvv,
                    colors: colors,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
