import 'package:flutter_riverpod/flutter_riverpod.dart';

// category
class SearchCategory extends StateNotifier<List<String>> {
  SearchCategory({required this.ref}) : super([]);

  Ref ref;

  Future<void> toggleItem(String item) async {
    if (state.remove(item)) {
      state = [...state];
      return;
    }
    state = [...state, item];
  }

  Future<void> clear() async {
    state = [];
  }
}

final searchCategory =
    StateNotifierProvider<SearchCategory, List<String>>((ref) {
  return SearchCategory(ref: ref);
});

// location
class SearchLocation extends StateNotifier<List<String>> {
  SearchLocation({required this.ref}) : super([]);

  Ref ref;

  Future<void> toggleItem(String item) async {
    if (state.remove(item)) {
      state = [...state];
      return;
    }
    state = [...state, item];
  }

  Future<void> clear() async {
    state = [];
  }
}

final searchLocation =
    StateNotifierProvider<SearchLocation, List<String>>((ref) {
  return SearchLocation(ref: ref);
});
