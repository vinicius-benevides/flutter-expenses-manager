import 'package:expenses_manager/components/transaction_list/empty_list.dart';
import 'package:expenses_manager/components/transaction_list/transaction_card.dart';
import 'package:expenses_manager/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.onDelete,
  });

  final List<Transaction> transactions;
  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    final sortedTransactions = [...transactions]
      ..sort((a, b) => b.date.compareTo(a.date));

    return SizedBox(
      height: 400,
      child: sortedTransactions.isEmpty
          ? const EmptyList()
          : ListView.builder(
              itemCount: sortedTransactions.length,
              itemBuilder: (ctx, index) {
                final tr = sortedTransactions[index];
                return TransactionCard(transaction: tr, onDelete: onDelete);
              },
            ),
    );
  }
}
