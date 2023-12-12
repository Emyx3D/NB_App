import 'package:dio/dio.dart';
import 'package:naijabatternew/brain/constants.dart';

final dio = Dio(BaseOptions(
  validateStatus: (status) {
    return true;
  },
  baseUrl: baseURL,
  // connectTimeout: const Duration(seconds: 20),
));
