import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/models/product.dart';

Future<Product?> baseProductPromotion(String paramStr) async {
  final response = await dio.get('/promotion?$paramStr',
      options: Options(headers: headerFunc()));

  if (response.statusCode != 200 || (response.data as List).isEmpty) {
    return null;
  }
  final strData = (response.data as List<dynamic>)[0];
  Product data = Product.fromJson(strData);
  return data;
}

final barterProductPromotion = FutureProvider((ref) async {
  Product? data = await baseProductPromotion('productType=barter');
  return data;
});

final declutterProductPromotion = FutureProvider((ref) async {
  Product? data = await baseProductPromotion('productType=declutter');
  print(data);
  return data;
});
