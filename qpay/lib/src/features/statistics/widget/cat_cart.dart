import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';

class BuildCatCard extends StatelessWidget {
  final String category;
  final String amount;
  final String percentage;
  final IconData icon;
  const BuildCatCard({
    super.key,
    required this.category,
    required this.amount,
    required this.percentage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tertiaryColor.withOpacity(.3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 170,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: tertiaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category,
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    FontAwesomeIcons.ellipsis,
                    color: tertiaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 2),
                  Text(
                    amount,
                    style: TextStyle(
                      color: tertiaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      percentage,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
