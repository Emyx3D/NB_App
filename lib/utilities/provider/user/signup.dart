import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/main.dart';
import 'package:naijabatternew/utilities/forms/forms_collection.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/views/confirm_email_view.dart';
import 'package:naijabatternew/views/declutter_business_payment_screen.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/views/login_view.dart';

final loadingSignup = StateProvider((ref) => false);
final emailProvider = StateProvider((ref) => '');
final passwordProvider = StateProvider((ref) => '');
final usernameProvider = StateProvider((ref) => '');
final nameProvider = StateProvider((ref) => '');
final phoneProvider = StateProvider((ref) => '');

final signup = Provider<Signup>((ref) {
  return Signup(ref);
});

class Signup {
  Signup(this._ref);

  final Ref _ref;

  String get getEmail {
    return _ref.watch(emailProvider);
  }

  String get getPassword {
    return _ref.watch(passwordProvider);
  }

  String get getUsername {
    return _ref.watch(usernameProvider);
  }

  String get getName {
    return _ref.watch(nameProvider);
  }

  String get getPhone {
    return _ref.watch(phoneProvider);
  }

  Future loginUser(context, String email, String password) async {
    _ref.read(loadingSignup.notifier).state = true;
    final response = await dio.post(
      '/login',
      data: {
        "email": email,
        "password": password,
      },
    );
    _ref.read(loadingSignup.notifier).state = false;

    if (response.statusCode == 450) {
      await sendConfirmEmail(context, email);
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmEmailPage(),
        ),
      );
      return;
    }

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    await prefs.setString('user', jsonEncode(response.data));

    successSnackbar('login successful');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  Future changePassword(context, String oldPassword, String newPassword) async {
    _ref.read(loadingSignup.notifier).state = true;

    final response = await dio.post('/change-password',
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
        options: Options(headers: headerFunc()));
    _ref.read(loadingSignup.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar('Password changed successfully');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  Future sendConfirmEmail(context, String email) async {
    _ref.read(emailProvider.notifier).state = email;

    await dio.post(
      '/send-confirm-email',
      data: {
        "email": email,
      },
    );
  }

  Future confirmEmail(context, String otp) async {
    _ref.read(loadingSignup.notifier).state = true;

    final response = await dio.post(
      '/confirm-email',
      data: {
        "email": getEmail,
        "otp": otp,
      },
    );
    _ref.read(loadingSignup.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar('Email confirmed you can login');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }

  Future signupUser(context, String email, String username, String password,
      String name, String phone) async {
    _ref.read(loadingSignup.notifier).state = true;

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
    _ref.read(loadingSignup.notifier).state = false;

    if (response.statusCode != 201) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    await sendConfirmEmail(context, email);
    successSnackbar('Signup successful');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmEmailPage(),
      ),
    );
  }

  Future signupBusiness1(context, String email, String username,
      String password, String name, String phone) async {
    _ref.read(loadingSignup.notifier).state = true;

    _ref.read(emailProvider.notifier).state = email;
    _ref.read(usernameProvider.notifier).state = username;
    _ref.read(nameProvider.notifier).state = name;
    _ref.read(passwordProvider.notifier).state = password;
    _ref.read(phoneProvider.notifier).state = phone;

    _ref.read(loadingSignup.notifier).state = false;

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BusinessForm2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  Future signupBusiness2(
      context, String businessName, String regNo, String location) async {
    _ref.read(loadingSignup.notifier).state = true;

    final response = await dio.post(
      '/signup-business',
      data: {
        "email": getEmail,
        "username": getUsername,
        "password": getPassword,
        "name": getName,
        "phone": getPhone,
        "business_name": businessName,
        "registration_no": regNo,
        "location": location,
      },
    );
    _ref.read(loadingSignup.notifier).state = false;

    if (response.statusCode != 201) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    await sendConfirmEmail(context, getEmail);

    successSnackbar('Signup successful');

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const DeclutterBusinessPaymentScreen();
    }));
  }
}
