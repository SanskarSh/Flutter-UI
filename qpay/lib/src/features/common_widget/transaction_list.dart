import 'package:flutter/material.dart';
import 'package:qpay/src/config/constants.dart';
import 'package:qpay/src/features/transactions/model/transaction_model.dart';
import 'package:qpay/src/features/common_widget/transaction_tile_item.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Transaction> _transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() {
    Future.delayed(const Duration(milliseconds: 100), () {
      for (var i = 0; i < transactions.length; i++) {
        Future.delayed(Duration(milliseconds: i * 100), () {
          _transactions.add(transactions[i]);
          _listKey.currentState?.insertItem(
            _transactions.length - 1,
            duration: const Duration(milliseconds: 300),
          );
        });
      }
    });
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    final transaction = _transactions[index];
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ),
      child: FadeTransition(
        opacity: animation,
        child: TransactionTile(
          title: transaction.title,
          amount: transaction.amount,
          date: transaction.date,
          icon: transaction.icon,
          iconColor: transaction.iconColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      key: _listKey,
      initialItemCount: _transactions.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(context, index, animation);
      },
    );
  }
}
