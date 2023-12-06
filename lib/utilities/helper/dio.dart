import 'package:dio/dio.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';

Map<String, dynamic> headerFunc() {
  User? user = getUser();
  String authToken = user?.token ?? '';

  Map<String, dynamic> res = {
    'Authorization': 'Bearer $authToken',
  };
  return res;
}

final dio = Dio(BaseOptions(
  validateStatus: (status) {
    return true;
  },
  baseUrl: baseURL,
  headers: headerFunc(),
  // connectTimeout: const Duration(seconds: 20),
));
