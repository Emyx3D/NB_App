import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/utilities/models/user.dart';

import '../../../main.dart';

final loadingUser = StateProvider((ref) => false);

final userProvider = StateProvider<UserObj>((ref) {
  return UserObj(ref);
});

class UserObj {
  UserObj(this._ref);

  final Ref _ref;

  User? userObj() {
    String? user = prefs.getString('user');
    if (user == null) {
      return null;
    }

    final jsonData = jsonDecode(user);
    return User.fromJson(jsonData);
  }

  Future getUser(context, String otp) async {
    _ref.read(loadingUser.notifier).state = true;
    final response = await dio.get('/auth-user');
    _ref.read(loadingUser.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    await prefs.setString('user', jsonEncode(response.data));
  }
}
