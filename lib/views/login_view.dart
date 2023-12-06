import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/main.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';

import '../brain/app_brain.dart';
import '../utilities/colors.dart';
import '../utilities/helper/dio.dart';
import '../views/accesibility_page.dart';
import '../views/forgot_password_view.dart';
import '../views/homepage_view.dart';
import '../views/register_view.dart';
import '../widgets/fields_content.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // logic
  bool isLoading = false;

  Future loginFunc(context) async {
    setState(() {
      isLoading = true;
    });
    final response = await dio.post(
      '/login',
      data: {
        "email": emailController.text,
        "password": passwordController.text
      },
    );
    setState(() {
      isLoading = false;
    });
    if (response.statusCode != 200) {
      failedSnackbar(context, response.data?['error'] ?? 'An error occured');
      return;
    }

    await prefs.setString('user', jsonEncode(response.data));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/nblogo.png",
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            FormHeaderText(
              textInput: 'Sign In',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            const SizedBox28(),
            Column(
              children: [
                TextFormField(
                  controller: emailController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  cursorColor: themeIsLight
                      ? const Color(0xFF4054BA)
                      : ProjectColors.darkThemeBorderColor,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeIsLight
                            ? const Color(0xFF4054BA)
                            : ProjectColors.darkThemeBorderColor,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 20.0,
                    ),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: themeIsLight
                          ? const Color(0x61000000)
                          : ProjectColors.bigTxtWhite,
                      fontFamily: "Roboto",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeIsLight
                            ? const Color(0xFF4054BA)
                            : ProjectColors.darkThemeBorderColor,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox19(),
                TextFormField(
                  controller: passwordController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  cursorColor: themeIsLight
                      ? const Color(0xFF4054BA)
                      : ProjectColors.darkThemeBorderColor,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: obscureText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeIsLight
                            ? const Color(0xFF4054BA)
                            : ProjectColors.darkThemeBorderColor,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 20.0,
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: themeIsLight
                          ? const Color(0x61000000)
                          : ProjectColors.bigTxtWhite,
                      fontFamily: "Roboto",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeIsLight
                            ? const Color(0xFF4054BA)
                            : ProjectColors.darkThemeBorderColor,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        color: themeIsLight
                            ? const Color(0xFF0F28A9)
                            : ProjectColors.darkThemeBorderColor,
                        onPressed: () {
                          setState(() {
                            toggle();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  heightFactor: 1.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordView(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 13.3,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        color: themeIsLight
                            ? const Color(0xFF0F28A9)
                            : ProjectColors.darkThemeBorderColor,
                      ),
                    ),
                  ),
                ),
                InputFieldButton(
                  onPressed: () => loginFunc(context),
                  buttonText: 'Sign In',
                  isLoading: isLoading,
                ),
                const SizedBox15(),
                BottomInputRow(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                  blackText: 'Don\'t have an account?',
                  buttonText: 'Sign Up',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
