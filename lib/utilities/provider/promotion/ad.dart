import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/models/ad.dart';

Future<List<Ad>> baseProductPromotion(String paramStr) async {
  final response =
      await dio.get('/ad?$paramStr', options: Options(headers: headerFunc()));

  if (response.statusCode != 200 || (response.data as List).isEmpty) {
    return [];
  }
  List<Ad> data = (response.data as List).map((e) => Ad.fromJson(e)).toList();
  return data;
}

final ad = FutureProvider.family((ref, int limit) async {
  List<Ad> data = await baseProductPromotion('limit=$limit');
  return data;
});
