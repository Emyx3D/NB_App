import 'package:intl/intl.dart';

String formattedPrice(double value) {
  final numberFormat = NumberFormat('#,##0.00');
  return numberFormat.format(value);
}
