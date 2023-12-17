import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naijabatternew/main.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/views/landing_page.dart';
import 'package:naijabatternew/views/login_view.dart';

User? getUser() {
  String? user = prefs.getString('user');
  if (user == null) {
    return null;
  }
  final jsonData = jsonDecode(user);
  return User.fromJson(jsonData);
}

User getUserOrNa() {
  String? user = prefs.getString('user');
  if (user == null) {
    return User.fromJson(null);
  }
  final jsonData = jsonDecode(user);
  return User.fromJson(jsonData);
}

checkUserAuth(context) async {
  User? haveUser = getUser();
  if (haveUser == null) {
    removeUser();

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
    removeUser();

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

  if (isAuth == true) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ),
      (route) => false,
    );
  } else {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LandingPage();
        },
      ),
      (route) => false,
    );
  }
}

Future<bool> removeUser() async {
  return prefs.remove('user');
}

Future logoutUser() async {
  await dio.get('/logout', options: Options(headers: headerFunc()));
  await removeUser();
}

Future deleteMyAccount() async {
  await dio.delete('/user-delete', options: Options(headers: headerFunc()));
  await removeUser();
}

Future<bool> isAuthorized() async {
  try {
    final response =
        await dio.get('/auth-user', options: Options(headers: headerFunc()));
    if (response.statusCode == 200) {
      await prefs.setString('user', jsonEncode(response.data));
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
