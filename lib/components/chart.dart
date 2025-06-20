import 'package:expenses_manager/components/chart_bar.dart';
import 'package:expenses_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<GroupedTransaction> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay =
            recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year;

        if (sameDay) {
          totalSum += recentTransactions[i].value;
        }
      }

      return GroupedTransaction(
        day: DateFormat.E().format(weekDay)[0],
        value: totalSum,
      );
    }).reversed.toList();
  }

  double get _maxValue {
    return groupedTransactions.fold(
      0.0,
      (max, tr) => tr.value > max ? tr.value : max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr.day,
                value: tr.value,
                percentage: _maxValue == 0 ? 0 : tr.value / _maxValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
