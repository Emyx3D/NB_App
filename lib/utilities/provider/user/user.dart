import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/utilities/models/user.dart';

import '../../../main.dart';

final loadingUser = StateProvider((ref) => false);

final userProductCount = StateProvider((ref) async {
  final response = await dio.get('/user-product-count',
      options: Options(headers: headerFunc()));

  if (response.statusCode != 200) {
    failedSnackbar(response.data?['error'] ?? 'An error occured');
    return {"barter": 0, "gift": 0, "declutter": 0};
  }
  print(response.data);
  return {
    'barter': response.data['barter'],
    'declutter': response.data['declutter'],
    'gift': response.data['gift'],
  };
});

final user = StateProvider<UserObj>((ref) {
  return UserObj(ref);
});

class UserObj {
  UserObj(this._ref);

  final Ref _ref;

  User userObj() {
    String? user = prefs.getString('user');
    if (user == null) {
      return User.fromJson(null);
    }

    final jsonData = jsonDecode(user);
    return User.fromJson(jsonData);
  }

  Future getUser(context) async {
    _ref.read(loadingUser.notifier).state = true;
    final response = await dio.get('/auth-user');
    _ref.read(loadingUser.notifier).state = false;
    print(response.data);

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    await prefs.setString('user', jsonEncode(response.data));
  }
}
