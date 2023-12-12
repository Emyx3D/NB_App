import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/models/category.dart';
import 'package:naijabatternew/utilities/models/location.dart';

final category = FutureProvider<List<Category>>((ref) async {
  final response = await dio.get('/category?page=1&limit=1000',
      options: Options(headers: headerFunc()));

  if (response.statusCode != 200) {
    return [];
  }

  List<Category> data =
      (response.data as List).map((e) => Category.fromJson(e)).toList();
  return data;
});

final location = FutureProvider<List<Location>>((ref) async {
  final response = await dio.get('/location?page=1&limit=1000',
      options: Options(headers: headerFunc()));

  if (response.statusCode != 200) {
    return [];
  }

  List<Location> data =
      (response.data as List).map((e) => Location.fromJson(e)).toList();
  return data;
});
