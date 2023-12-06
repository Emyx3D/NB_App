import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naijabatternew/main.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/views/login_view.dart';

User? getUser() {
  String? user = prefs.getString('user');
  if (user == null) {
    return null;
  }
  final jsonData = jsonDecode(user);
  return User.fromJson(jsonData);
}

checkUserAuth(context) async {
  User? haveUser = getUser();
  if (haveUser == null) {
    deleteUser();

    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
      (route) => false,
    );
  }
}

checkAuth(context) async {
  bool isAuth = await isAuthorized();
  if (isAuth == false) {
    failedSnackbar("Please login to continue", "Login to continue!");
    deleteUser();

    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
      (route) => false,
    );
  }
}

isLoggedIn(context) async {
  bool isAuth = await isAuthorized();

  if (isAuth == false) {
    // deleteUser();

    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ),
      (route) => false,
    );
  }
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      },
    ),
    (route) => false,
  );
}

Future<bool> deleteUser() async {
  return prefs.remove('user');
}

Future logoutUser() async {
  await dio.get('/logout');
  await deleteUser();
}

Options authHeader([String? authToken, String? contentType]) {
  if (authToken == null) {
    User? user = getUser();
    authToken = user?.token ?? '';
  }

  Map<String, dynamic> res = {
    'Authorization': 'Bearer $authToken',
  };

  // 'Content-Type': 'application/json', 'application/x-www-form-urlencoded'
  if (contentType != null) {
    res['Content-Type'] = contentType;
  }

  return Options(headers: res);
}

Future<bool> isAuthorized() async {
  try {
    final response = await dio.get('/auth-user');
    if (response.statusCode == 200) {
      await prefs.setString('user', jsonEncode(response.data));
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
