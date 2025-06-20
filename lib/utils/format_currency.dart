import 'package:intl/intl.dart';

String formatCurrency(double value) {
  final valueFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );
  return valueFormat.format(value);
}
