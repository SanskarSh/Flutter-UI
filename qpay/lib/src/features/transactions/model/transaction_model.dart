import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String amount;
  final String date;
  final IconData icon;
  final Color iconColor;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.iconColor,
  });
}
