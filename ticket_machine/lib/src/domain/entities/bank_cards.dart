import 'package:flutter/material.dart';

class BankCards {
  final String bankName;
  final String cardType;
  final String cvv;
  final List<Color> colors;

  static final List<BankCards> fakeBankCards = [
    BankCards(
      bankName: 'Bank of America',
      cardType: 'MasterCard',
      cvv: '123',
       colors: [
                Colors.deepOrange.shade300,
                Colors.pinkAccent,
                Colors.purple.shade700,
                Colors.purple.shade800,
              ],
    ),
    BankCards(
      bankName: 'Chase',
      cardType: 'Visa',
      cvv: '456',
      colors: [
        Colors.blue.shade300,
        Colors.blueAccent,
        Colors.blue.shade700,
        Colors.blue.shade800,
      ],
    ),
    BankCards(
      bankName: 'Wells Fargo',
      cardType: 'MasterCard',
      cvv: '789',
      colors: [
        Colors.green.shade300,
        Colors.greenAccent,
        Colors.green.shade700,
        Colors.green.shade800,
      ],
    ),
    BankCards(
      bankName: 'Citi Bank',
      cardType: 'Visa',
      cvv: '012',
      colors: [
        Colors.red.shade300,
        Colors.redAccent,
        Colors.red.shade700,
        Colors.red.shade800,
      ],
    ),
    BankCards(
      bankName: 'Capital One',
      cardType: 'MasterCard',
      cvv: '345',
      colors: [
        Colors.yellow.shade300,
        Colors.yellowAccent,
        Colors.yellow.shade700,
        Colors.yellow.shade800,
      ],
    ),
    BankCards(
      bankName: 'US Bank',
      cardType: 'Visa',
      cvv: '678',
      colors: [
        Colors.purple.shade300,
        Colors.purpleAccent,
        Colors.purple.shade700,
        Colors.purple.shade800,
      ],
    ),
    BankCards(
      bankName: 'PNC Bank',
      cardType: 'MasterCard',
      cvv: '901',
      colors: [
        Colors.orange.shade300,
        Colors.orangeAccent,
        Colors.orange.shade700,
        Colors.orange.shade800,
      ],
    ),
    BankCards(
      bankName: 'TD Bank',
      cardType: 'Visa',
      cvv: '234',
      colors: [
        Colors.teal.shade300,
        Colors.tealAccent,
        Colors.teal.shade700,
        Colors.teal.shade800,
      ],
    ),
    BankCards(
      bankName: 'BB&T',
      cardType: 'MasterCard',
      cvv: '567',
      colors: [
        Colors.indigo.shade300,
        Colors.indigoAccent,
        Colors.indigo.shade700,
        Colors.indigo.shade800,
      ],
    ),
  ];

  BankCards({
    required this.bankName,
    required this.cardType,
    required this.cvv,
    required this.colors,
  });
}
