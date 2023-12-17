import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/utilities/provider/user/user.dart';

Future<List<Product>> baseProduct(String paramStr, int page, int limit) async {
  final response = await dio.get('/product?$paramStr&page=$page&limit=$limit',
      options: Options(headers: headerFunc()));

  if (response.statusCode != 200) {
    return [];
  }

  List<Product> data =
      (response.data as List).map((e) => Product.fromJson(e)).toList();
  return data;
}

// hotDealsProduct
final loadingHotDealsProduct = StateProvider<bool>((ref) {
  return false;
});

class HotDealsNotifier extends StateNotifier<Future<List<Product>>> {
  HotDealsNotifier({required this.ref})
      : super(baseProduct('isPromoted=true', 1, 2));

  Ref ref;
  int page = 2;
  int limit = 2;

  Future<void> fetchMore() async {
    ref.watch(loadingHotDealsProduct.notifier).state = true;
    Future<List<Product>> data = baseProduct('isPromoted=true', page, limit);

    final fornow = await Future.wait([state, data]);

    state = Future(() => fornow.expand((list) => list).toList());
    ref.watch(loadingHotDealsProduct.notifier).state = false;
    if ((await data).isNotEmpty) {
      page += 1;
    }
  }

  Future<void> refetch() async {
    ref.watch(loadingHotDealsProduct.notifier).state = true;
    Future<List<Product>> data =
        baseProduct('isPromoted=true', page - 1, limit);

    state = data;
    ref.watch(loadingHotDealsProduct.notifier).state = false;
  }
}

final hotDealsProduct =
    StateNotifierProvider<HotDealsNotifier, Future<List<Product>>>((ref) {
  return HotDealsNotifier(ref: ref);
});

// userProduct
final loadingUserProduct = StateProvider<bool>((ref) {
  return false;
});

class UserProductNotifier extends StateNotifier<Future<List<Product>>> {
  UserProductNotifier({required this.ref, required this.user})
      : super(baseProduct('user=${user.id}', 1, 3));

  Ref ref;
  User user;
  int page = 2;
  int limit = 3;

  Future<void> fetchMore() async {
    ref.watch(loadingUserProduct.notifier).state = true;
    Future<List<Product>> data = baseProduct('user=${user.id}', page, limit);

    final fornow = await Future.wait([state, data]);

    state = Future(() => fornow.expand((list) => list).toList());
    ref.watch(loadingUserProduct.notifier).state = false;
    if ((await data).isNotEmpty) {
      page += 1;
    }
  }

  Future<void> refetch() async {
    ref.watch(loadingUserProduct.notifier).state = true;
    Future<List<Product>> data =
        baseProduct('user=${user.id}', page - 1, limit);

    state = data;
    ref.watch(loadingUserProduct.notifier).state = false;
  }
}

final userProduct =
    StateNotifierProvider<UserProductNotifier, Future<List<Product>>>((ref) {
  User user = ref.watch(userNotifier);
  return UserProductNotifier(ref: ref, user: user);
});

// declutter
final loadingDeclutter = StateProvider<bool>((ref) {
  return false;
});

class DeclutterProductNotifier extends StateNotifier<Future<List<Product>>> {
  DeclutterProductNotifier({required this.ref})
      : super(baseProduct('productType=declutter', 1, 2));

  Ref ref;
  int page = 2;
  int limit = 2;

  Future<void> fetchScrollListener(ScrollController scrollController) async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      ref.watch(loadingDeclutter.notifier).state = true;
      Future<List<Product>> data =
          baseProduct('productType=declutter', page, limit);

      final fornow = await Future.wait([state, data]);

      state = Future(() => fornow.expand((list) => list).toList());
      ref.watch(loadingDeclutter.notifier).state = false;
      if ((await data).isNotEmpty) {
        page += 1;
      }

      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollController.animateTo(
          scrollController.offset + 200,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}

final declutterProduct =
    StateNotifierProvider<DeclutterProductNotifier, Future<List<Product>>>(
        (ref) {
  return DeclutterProductNotifier(ref: ref);
});

// barter
final loadingBarter = StateProvider<bool>((ref) {
  return false;
});

class BarterProductNotifier extends StateNotifier<Future<List<Product>>> {
  BarterProductNotifier({required this.ref})
      : super(baseProduct('productType=barter', 1, 2));

  Ref ref;
  int page = 2;
  int limit = 2;

  Future<void> fetchScrollListener(ScrollController scrollController) async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      ref.watch(loadingBarter.notifier).state = true;
      Future<List<Product>> data =
          baseProduct('productType=barter', page, limit);

      final fornow = await Future.wait([state, data]);

      state = Future(() => fornow.expand((list) => list).toList());
      ref.watch(loadingBarter.notifier).state = false;
      if ((await data).isNotEmpty) {
        page += 1;
      }
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollController.animateTo(
          scrollController.offset + 200,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}

final barterProduct =
    StateNotifierProvider<BarterProductNotifier, Future<List<Product>>>((ref) {
  return BarterProductNotifier(ref: ref);
});

// gift
final loadingGift = StateProvider<bool>((ref) {
  return false;
});

class GiftProductNotifier extends StateNotifier<Future<List<Product>>> {
  GiftProductNotifier({required this.ref})
      : super(baseProduct('productType=gift', 1, 2));

  Ref ref;
  int page = 2;
  int limit = 2;

  Future<void> fetchScrollListener(ScrollController scrollController) async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      ref.watch(loadingGift.notifier).state = true;
      Future<List<Product>> data = baseProduct('productType=gift', page, limit);

      final fornow = await Future.wait([state, data]);

      state = Future(() => fornow.expand((list) => list).toList());
      ref.watch(loadingGift.notifier).state = false;
      if ((await data).isNotEmpty) {
        page += 1;
      }
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollController.animateTo(
          scrollController.offset + 200,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}

final giftProduct =
    StateNotifierProvider<GiftProductNotifier, Future<List<Product>>>((ref) {
  return GiftProductNotifier(ref: ref);
});

// search
final loadingSearch = StateProvider<bool>((ref) {
  return false;
});

class SearchProductNotifier extends StateNotifier<List<Product>> {
  SearchProductNotifier({required this.ref}) : super([]);
  Ref ref;
  Future search(String text) async {
    ref.watch(loadingSearch.notifier).state = true;

    int page = 1;
    int limit = 20;
    List<Product> data = await baseProduct('search=$text', page, limit);
    state = data;
    ref.watch(loadingSearch.notifier).state = false;
  }
}

final searchProductNotify =
    StateNotifierProvider<SearchProductNotifier, List<Product>>((ref) {
  return SearchProductNotifier(ref: ref);
});
