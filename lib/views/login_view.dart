import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../brain/app_brain.dart';
import '../constants/fields_content.dart';
import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/forgot_password_view.dart';
import '../views/homepage_view.dart';
import '../views/register_view.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
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
            FormHeaderText(
              textInput: 'Sign In',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            const SizedBox28(),
            Column(
              children: [
                const InputField(
                  enableSuggestions: true,
                  autocorrect: false,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email Address',
                ),
                const SizedBox19(),
                TextFormField(
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
                          builder: (context) => const ForgotPasswordView(),
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }));
                  },
                  buttonText: 'Sign In',
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
