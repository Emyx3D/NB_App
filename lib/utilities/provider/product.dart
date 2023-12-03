import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/utilities/provider/login/login.dart';

Future<List<Product>> baseProduct(String paramStr, int page, int limit) async {
  User? user = userObj();
  final response = await dio.get<List<Map<String, dynamic>>>(
      '$baseURL/product?page=$page&limit=$limit&$paramStr',
      options: Options(headers: {
        'Authorization': 'Bearer ${user?.token ?? ""}',
      }));

  List<Product> data =
      response.data?.map((e) => Product.fromJson(e)).toList() ?? [];
  return data;
}

Provider<Future<List<Product>>> searchProductProvider(String search,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    List<Product> data = await baseProduct('search=$search', page, limit);
    return data;
  });
}

Provider<Future<List<Product>>> userProductProvider(String user,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    List<Product> data = await baseProduct('user=$user', page, limit);

    return data;
  });
}

Provider<Future<List<Product>>> typeProductProvider(String productType,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    List<Product> data =
        await baseProduct('productType=$productType', page, limit);

    return data;
  });
}
