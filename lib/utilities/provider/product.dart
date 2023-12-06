import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/product.dart';

Future<List<Product>> baseProduct(String paramStr, int page, int limit) async {
  final response = await dio.get<List<Map<String, dynamic>>>(
      '/product?page=$page&limit=$limit&$paramStr');

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

final testProduct = FutureProvider<List<Product>>((ref,
    {String productType = 'barter', int page = 1, int limit = 20}) async {
  return await baseProduct('productType=$productType', page, limit);
});
