import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/views/login_view.dart';
import 'package:naijabatternew/views/otp_entry_view.dart';
import 'package:naijabatternew/views/reset_password_view.dart';

final loading = StateProvider((ref) => false);
final emailProvider = StateProvider((ref) => '');
final otpProvider = StateProvider((ref) => '');

final forgotPassword = Provider<ForgotPassword>((ref) {
  return ForgotPassword(ref);
});

class ForgotPassword {
  ForgotPassword(this._ref);

  final Ref _ref;

  bool get isLoading {
    return _ref.watch(loading);
  }

  String get getEmail {
    return _ref.watch(emailProvider);
  }

  String get getOtp {
    return _ref.watch(otpProvider);
  }

  Future sendForgotPassword(context, String email) async {
    print('i am in the btn sendForgotPassword oo');

    _ref.read(loading.notifier).state = true;
    _ref.read(emailProvider.notifier).state = email;

    final response = await dio.post(
      '/forgot-password',
      data: {
        "email": email,
      },
    );
    print('response.statusCode ${response.statusCode}');
    print('response.data ${response.data}');
    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar(context, 'Email confirmation sent');
    _ref.read(loading.notifier).state = false;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OTPEntryPage(),
      ),
    );
  }

  Future verifyOtp(dynamic context, String otp) async {
    _ref.read(loading.notifier).state = true;
    _ref.read(otpProvider.notifier).state = otp;

    final response = await dio.post(
      '/verify-otp',
      data: {
        "email": getEmail,
        "otp": otp,
      },
    );
    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar(context, 'OTP Verified');
    _ref.read(loading.notifier).state = false;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPasswordView(),
      ),
    );
  }

  Future resetPassword(dynamic context, String password) async {
    _ref.read(loading.notifier).state = true;

    final response = await dio.post(
      '/reset-password',
      data: {
        "email": getEmail,
        "newPassword": password,
        "otp": getOtp,
      },
    );
    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar(context, 'Password Reset you can now login');
    _ref.read(loading.notifier).state = false;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
