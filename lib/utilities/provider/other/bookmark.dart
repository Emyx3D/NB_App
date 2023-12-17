import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/main.dart';

// Set<String> convertDynamicToSet(dynamic data) {
//   Set<String> result = {};

//   if (data is Set) {
//     for (var item in data) {
//       if (item is String) {
//         result.add(item);
//       }
//     }
//   }

//   return result;
// }

Map<dynamic, dynamic> bookmarkObject() {
  String? bookmark = prefs.getString('bookmark');
  if (bookmark == null) {
    return {};
  }

  final jsonData = jsonDecode(bookmark);

  return jsonData;
}

// bookmark
class Bookmark extends StateNotifier<Map<dynamic, dynamic>> {
  Bookmark({required this.ref}) : super(bookmarkObject());

  Ref ref;

  Future toggleItem(dynamic item) async {
    String? bookmark = prefs.getString('bookmark');
    print('bookmark $bookmark');
    if (bookmark == null) {
      var itemData = {item: item};
      await prefs.setString('bookmark', jsonEncode(itemData));
      state = itemData;
      return;
    }

    final jsonData = jsonDecode(bookmark);

    print('passed oo');
    print('passed 0');

    if ((jsonData as Map).remove(item) == item) {
      await prefs.setString('bookmark', jsonEncode(jsonData));
      state = jsonData;
      return;
    }

    print('passed 1');
    jsonData[item] = item;
    print('passed 2');
    await prefs.setString('bookmark', jsonEncode(jsonData));
    state = jsonData;
  }
}

final bookmark = StateNotifierProvider<Bookmark, Map<dynamic, dynamic>>((ref) {
  return Bookmark(ref: ref);
});
