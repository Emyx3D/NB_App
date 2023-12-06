import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/main.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/views/confirm_email_view.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/views/login_view.dart';

final loading = StateProvider((ref) => false);
final emailProvider = StateProvider((ref) => '');

final signup = Provider<Signup>((ref) {
  return Signup(ref);
});

class Signup {
  Signup(this._ref);

  final Ref _ref;

  bool get isLoading {
    return _ref.watch(loading);
  }

  String get getEmail {
    return _ref.watch(emailProvider);
  }

  Future confirmEmail(context, String otp) async {
    _ref.read(loading.notifier).state = true;

    final response = await dio.post(
      '/confirm-email',
      data: {
        "email": getEmail,
        "otp": otp,
      },
    );
    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar(context, 'Email confirmed you can login');
    _ref.read(loading.notifier).state = false;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  Future signupUser(context, String email, String username, String password,
      String name, String phone) async {
    _ref.read(loading.notifier).state = true;

    final response = await dio.post(
      '/signup',
      data: {
        "email": email,
        "username": username,
        "password": password,
        "name": name,
        "phone": phone,
      },
    );
    _ref.read(loading.notifier).state = false;

    print(response.statusCode);
    print(response.data);
    if (response.statusCode != 201) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar(context, 'Signup successful');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmEmailPage(),
      ),
    );
  }

  Future loginUser(context, String email, String password) async {
    _ref.read(loading.notifier).state = true;

    final response = await dio.post(
      '/login',
      data: {
        "email": email,
        "password": password,
      },
    );
    _ref.read(loading.notifier).state = false;

    if (response.statusCode == 450) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmEmailPage(),
        ),
      );
      return;
    }

    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    await prefs.setString('user', jsonEncode(response.data));

    successSnackbar(context, 'login successful');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}
