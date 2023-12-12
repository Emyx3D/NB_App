import 'package:intl/intl.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';

String formattedPrice(double value) {
  final numberFormat = NumberFormat('#,##0.00');
  return numberFormat.format(value);
}

Map<String, dynamic> headerFunc() {
  User? user = getUser();
  String authToken = user?.token ?? '';

  Map<String, dynamic> res = {
    'Authorization': 'Bearer $authToken',
  };
  return res;
}
