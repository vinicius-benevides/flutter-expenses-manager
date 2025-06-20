import 'package:expenses_manager/components/chart/chart_bar.dart';
import 'package:expenses_manager/models/transaction.dart';
import 'package:expenses_manager/utils/is_same_day.dart';
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
        if (isSameDay(recentTransactions[i].date, weekDay)) {
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
          spacing: 10,
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
