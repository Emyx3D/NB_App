import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  validateStatus: (status) {
    return true;
  },
));
