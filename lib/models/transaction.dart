import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  get formattedValue {
    return 'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  get formattedDate {
    return DateFormat('d MMM y').format(date);
  }

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
