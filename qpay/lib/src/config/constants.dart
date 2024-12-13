import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/features/statistics/model/bar.dart';
import 'package:qpay/src/features/transactions/model/transaction_model.dart';

List<Bar> bars = [
  Bar(day: 'Mon', value: 6),
  Bar(day: 'Tue', value: 4),
  Bar(day: 'Wed', value: 5),
  Bar(day: 'Thu', value: 6),
  Bar(day: 'Fri', value: 1),
  Bar(day: 'Sat', value: 5),
  Bar(day: 'Sun', value: 4),
];

final List<Map<String, dynamic>> categoryCards = [
  {
    'category': 'Game',
    'amount': '\$5,325',
    'percentage': '+25%',
    'icon': FontAwesomeIcons.gamepad,
  },
  {
    'category': 'Shopping',
    'amount': '\$3,428',
    'percentage': '+12%',
    'icon': FontAwesomeIcons.cartShopping,
  },
  {
    'category': 'Food',
    'amount': '\$2,925',
    'percentage': '+8%',
    'icon': FontAwesomeIcons.utensils,
  },
  {
    'category': 'Transport',
    'amount': '\$1,850',
    'percentage': '+15%',
    'icon': FontAwesomeIcons.car,
  },
];

final List<Transaction> transactions = [
  Transaction(
    title: "Coffee",
    amount: "-\$5.00",
    date: "Today",
    icon: Icons.coffee,
    iconColor: Colors.brown,
  ),
  Transaction(
    title: "Salary",
    amount: "+\$3000.00",
    date: "Yesterday",
    icon: Icons.work,
    iconColor: Colors.green,
  ),
  Transaction(
    title: "Grocery Shopping",
    amount: "-\$85.50",
    date: "Yesterday",
    icon: Icons.shopping_cart,
    iconColor: Colors.orange,
  ),
  Transaction(
    title: "Netflix Subscription",
    amount: "-\$15.99",
    date: "2 days ago",
    icon: Icons.movie,
    iconColor: Colors.red,
  ),
  Transaction(
    title: "Uber Ride",
    amount: "-\$24.30",
    date: "2 days ago",
    icon: Icons.local_taxi,
    iconColor: Colors.black,
  ),
  Transaction(
    title: "Freelance Payment",
    amount: "+\$850.00",
    date: "3 days ago",
    icon: Icons.computer,
    iconColor: Colors.blue,
  ),
  Transaction(
    title: "Electric Bill",
    amount: "-\$75.20",
    date: "4 days ago",
    icon: Icons.electric_bolt,
    iconColor: Colors.yellow,
  ),
  Transaction(
    title: "Gym Membership",
    amount: "-\$49.99",
    date: "5 days ago",
    icon: Icons.fitness_center,
    iconColor: Colors.purple,
  ),
  Transaction(
    title: "Restaurant Dinner",
    amount: "-\$68.35",
    date: "5 days ago",
    icon: Icons.restaurant,
    iconColor: Colors.red[300]!,
  ),
  Transaction(
    title: "Mobile Recharge",
    amount: "-\$30.00",
    date: "6 days ago",
    icon: Icons.phone_android,
    iconColor: Colors.green[700]!,
  ),
  Transaction(
    title: "Interest Received",
    amount: "+\$12.50",
    date: "7 days ago",
    icon: Icons.account_balance,
    iconColor: Colors.blue[700]!,
  ),
  Transaction(
    title: "Amazon Purchase",
    amount: "-\$156.78",
    date: "7 days ago",
    icon: Icons.shopping_bag,
    iconColor: Colors.orange[700]!,
  ),
];

//! Colors
Color primaryColor = const Color(0Xff171717);
Color secondaryColor = const Color(0XFF2DD4BF);
Color tertiaryColor = const Color(0XFFD9D9D9);

//! TextStyles
const displayLarge =
    TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold);

final displayMedium = TextStyle(color: primaryColor, fontSize: 40);
final bodyMedium = TextStyle(color: primaryColor);
final titleMedium = TextStyle(color: primaryColor);
