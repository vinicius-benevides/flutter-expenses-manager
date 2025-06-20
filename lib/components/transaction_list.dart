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
          ? Column(
              spacing: 50,
              children: [
                Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ],
            )
          : ListView.builder(
              itemCount: sortedTransactions.length,
              itemBuilder: (ctx, index) {
                final tr = sortedTransactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            tr.formattedValue,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      tr.formattedDate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () => onDelete(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
