import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/product.dart';

Future<List<Product>> baseProduct(String paramStr, int page, int limit) async {
  final response = await dio.get('/product?$paramStr&page=$page&limit=$limit');
  List<Product> data =
      (response.data as List).map((e) => Product.fromJson(e)).toList();
  return data;
}

final barterProduct = Provider((ref) async {
  int page = 1;
  int limit = 20;
  List<Product> data = await baseProduct('productType=barter', page, limit);
  return data;
});

final giftProduct = Provider((ref) async {
  int page = 1;
  int limit = 20;
  List<Product> data = await baseProduct('productType=gift', page, limit);
  return data;
});

final declutterProduct = Provider((ref) async {
  int page = 1;
  int limit = 20;
  List<Product> data = await baseProduct('productType=declutter', page, limit);
  return data;
});

final userProduct = Provider.family((ref, String user) async {
  int page = 1;
  int limit = 20;
  List<Product> data = await baseProduct('user=$user', page, limit);
  return data;
});

final searchProduct = Provider.family((ref, String search) async {
  int page = 1;
  int limit = 20;
  List<Product> data = await baseProduct('search=$search', page, limit);
  return data;
});
