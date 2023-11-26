import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/otp_entry_view.dart';
import '../views/register_view.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PreviousPageIcon(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 165.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormHeaderText(
                      textInput: 'Forgot Password',
                      color: themeIsLight
                          ? Colors.black
                          : ProjectColors.bigTxtWhite,
                    ),
                    const SizedBox28(),
                    const InputField(
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Enter Your Email Address',
                      obscureText: false,
                    ),
                    const SizedBox19(),
                    InputFieldButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const OTPEntryPage(),
                          ),
                        );
                      },
                      buttonText: 'Get OTP',
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
