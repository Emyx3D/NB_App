import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/user/forgot_password.dart';

import '../brain/app_brain.dart';
import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../widgets/fields_content.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ConsumerState<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider = ref.watch(forgotPassword);
    final loadingForgotPasswordProvider = ref.watch(loadingForgotPassword);
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormHeaderText(
              textInput: 'Reset Password',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            const SizedBox28(),
            TextFormField(
              controller: passwordController,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              cursorColor: const Color(0xFF4054BA),
              enableSuggestions: false,
              autocorrect: false,
              obscureText: obscureText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4054BA),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.0),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20.0,
                ),
                hintText: 'Enter New Password',
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0x61000000),
                  fontFamily: "Roboto",
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4054BA),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.0),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    color: const Color(0xFF0F28A9),
                    onPressed: () {
                      setState(() {
                        toggle();
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox19(),
            TextFormField(
              controller: confirmPasswordController,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              cursorColor: const Color(0xFF4054BA),
              enableSuggestions: false,
              autocorrect: false,
              obscureText: obscureText2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4054BA),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.0),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20.0,
                ),
                hintText: 'Confirm Password',
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0x61000000),
                  fontFamily: "Roboto",
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4054BA),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.0),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    icon: Icon(
                      obscureText2 ? Icons.visibility : Icons.visibility_off,
                    ),
                    color: const Color(0xFF0F28A9),
                    onPressed: () {
                      setState(() {
                        toggle2();
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox26(),
            InputFieldButton(
              buttonText: 'Change Password',
              isLoading: loadingForgotPasswordProvider,
              onPressed: () async {
                await forgotPasswordProvider.resetPassword(
                    context, passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
