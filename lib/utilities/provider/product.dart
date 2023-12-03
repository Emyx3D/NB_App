import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/product.dart';

Provider<Future<List<Product>>> searchProductProvider(String search,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    final response = await dio
        .get<List<Map<String, dynamic>>>('$baseURL/product?search=$search');

    List<Product> data =
        response.data?.map((e) => Product.fromJson(e)).toList() ?? [];
    return data;
  });
}

Provider<Future<List<Product>>> userProductProvider(String user,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    final response = await dio
        .get<List<Map<String, dynamic>>>('$baseURL/product?user=$user');

    List<Product> data =
        response.data?.map((e) => Product.fromJson(e)).toList() ?? [];
    return data;
  });
}

Provider<Future<List<Product>>> typeProductProvider(String productType,
    [int page = 1, int limit = 20]) {
  return Provider<Future<List<Product>>>((ref) async {
    final response = await dio.get<List<Map<String, dynamic>>>(
        '$baseURL/product?productType=$productType');

    List<Product> data =
        response.data?.map((e) => Product.fromJson(e)).toList() ?? [];
    return data;
  });
}
