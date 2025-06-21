import 'package:intl/intl.dart';

String formatCurrency(double value) {
  final compact = NumberFormat.compactCurrency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );
  return compact.format(value);
}
