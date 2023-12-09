import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';

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

final userProduct = Provider((ref) async {
  final user = getUser();
  int page = 1;
  int limit = 20;
  List<Product> data =
      await baseProduct('user=${user?.id ?? "0"}', page, limit);
  return data;
});

final hotDealsProduct = Provider((ref) async {
  final user = getUser();
  int page = 1;
  int limit = 20;
  List<Product> data =
      await baseProduct('user=${user?.id ?? "0"}', page, limit);
  return data;
});

// final searchProduct = Provider.family((ref, String search) async {
//   int page = 1;
//   int limit = 20;
//   List<Product> data = await baseProduct('search=$search', page, limit);
//   return data;
// });

class SearchProductNotifier extends StateNotifier<List<Product>> {
  SearchProductNotifier() : super([]);

  void search(String text) async {
    print('text $text');
    int page = 1;
    int limit = 20;
    List<Product> data = await baseProduct('search=$text', page, limit);
    state = data;
  }
}

final searchProductNotify =
    StateNotifierProvider<SearchProductNotifier, List<Product>>((ref) {
  return SearchProductNotifier();
});
