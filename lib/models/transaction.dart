import 'package:expenses_manager/utils/format_currency.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  get formattedValue {
    return formatCurrency(value);
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

class GroupedTransaction {
  final String day;
  final double value;

  const GroupedTransaction({required this.day, required this.value});
}
