import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
import 'package:naijabatternew/views/login_view.dart';
import 'package:naijabatternew/views/otp_entry_view.dart';
import 'package:naijabatternew/views/reset_password_view.dart';

final loadingForgotPassword = StateProvider((ref) => false);
final emailProvider = StateProvider((ref) => '');
final otpProvider = StateProvider((ref) => '');

final forgotPassword = StateProvider<ForgotPassword>((ref) {
  return ForgotPassword(ref);
});

class ForgotPassword {
  ForgotPassword(this._ref);

  final Ref _ref;

  String get getEmail {
    return _ref.watch(emailProvider);
  }

  String get getOtp {
    return _ref.watch(otpProvider);
  }

  Future sendForgotPassword(context, String email) async {
    _ref.read(loadingForgotPassword.notifier).state = true;
    _ref.read(emailProvider.notifier).state = email;

    final response = await dio.post(
      '/forgot-password',
      data: {
        "email": email,
      },
    );
    _ref.read(loadingForgotPassword.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar('Email confirmation sent');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OTPEntryPage(),
      ),
    );
  }

  Future verifyOtp(context, String otp) async {
    _ref.read(loadingForgotPassword.notifier).state = true;
    _ref.read(otpProvider.notifier).state = otp;

    final response = await dio.post(
      '/verify-otp',
      data: {
        "email": getEmail,
        "otp": otp,
      },
    );

    _ref.read(loadingForgotPassword.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar('OTP Verified');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResetPasswordView(),
      ),
    );
  }

  Future resetPassword(context, String password) async {
    _ref.read(loadingForgotPassword.notifier).state = true;

    final response = await dio.post(
      '/reset-password',
      data: {
        "email": getEmail,
        "newPassword": password,
        "otp": getOtp,
      },
    );

    _ref.read(loadingForgotPassword.notifier).state = false;

    if (response.statusCode != 200) {
      failedSnackbar(response.data?['error'] ?? 'An error occured');
      return;
    }

    successSnackbar('Password Reset you can now login');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
