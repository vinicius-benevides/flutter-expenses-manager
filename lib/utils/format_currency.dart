import 'package:intl/intl.dart';

String formatCurrency(double value) {
  if (value < 1000) {
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(value);
  } else if (value < 1000000) {
    double abbreviated = value / 1000;
    return 'R\$ ${abbreviated.toStringAsFixed(abbreviated.truncateToDouble() == abbreviated ? 0 : 1)}K';
  } else if (value < 1000000000) {
    double abbreviated = value / 1000000;
    return 'R\$ ${abbreviated.toStringAsFixed(abbreviated.truncateToDouble() == abbreviated ? 0 : 1)}M';
  } else {
    double abbreviated = value / 1000000000;
    return 'R\$ ${abbreviated.toStringAsFixed(abbreviated.truncateToDouble() == abbreviated ? 0 : 1)}B';
  }
}
