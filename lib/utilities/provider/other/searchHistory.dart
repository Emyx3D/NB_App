import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/main.dart';

List<String> convertDynamicToList(dynamic data) {
  List<String> result = [];

  if (data is List) {
    // Check if the dynamic data is a List
    for (var item in data) {
      // Check if each item in the list is a String
      if (item is String) {
        result.add(item);
      }
    }
  }

  return result;
}

List<String> searchHistoryObject() {
  String? searchHistory = prefs.getString('searchHistory');
  if (searchHistory == null) {
    return [];
  }
  print('history $searchHistory');

  final jsonData = jsonDecode(searchHistory);

  print('passed the point $jsonData');
  return convertDynamicToList(jsonData);
}

// SearchHistory
class SearchHistory extends StateNotifier<List<String>> {
  SearchHistory({required this.ref}) : super(searchHistoryObject());

  Ref ref;

  Future setItem(String item) async {
    String? searchHistory = prefs.getString('searchHistory');
    if (searchHistory == null) {
      await prefs.setString('searchHistory', jsonEncode([item]));
      getSearchHistory();
      return;
    }

    final jsonData = convertDynamicToList(jsonDecode(searchHistory));
    jsonData.remove(item);

    jsonData.insert(0, item);

    await prefs.setString('searchHistory', jsonEncode(jsonData));
    state = convertDynamicToList(jsonData);
  }

  getSearchHistory() {
    String? searchHistory = prefs.getString('searchHistory');
    if (searchHistory == null) {
      state = [];
      return;
    }

    final jsonData = jsonDecode(searchHistory);
    state = convertDynamicToList(jsonData);

    return;
  }

  remove(String item) async {
    String? searchHistory = prefs.getString('searchHistory');
    if (searchHistory == null) {
      state = [];
      return;
    }

    final jsonData = convertDynamicToList(jsonDecode(searchHistory));
    jsonData.remove(item);
    await prefs.setString('searchHistory', jsonEncode(jsonData));
    state = convertDynamicToList(jsonData);
  }
}

final searchHistory = StateNotifierProvider<SearchHistory, List<String>>((ref) {
  return SearchHistory(ref: ref);
});
