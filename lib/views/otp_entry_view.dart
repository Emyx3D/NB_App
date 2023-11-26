import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/register_view.dart';
import '../views/reset_password_view.dart';

class OTPEntryPage extends ConsumerWidget {
  const OTPEntryPage({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormHeaderText(
                    textInput: 'Enter OTP',
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                  ),
                  const SizedBox28(),
                  const InputField(
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    hintText: 'OTP',
                    obscureText: false,
                    // maxLength: 6,
                  ),
                  const SizedBox19(),
                  InputFieldButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordView(),
                        ),
                      );
                    },
                    buttonText: 'Confirm',
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
            )
          ],
        ),
      ),
    );
  }
}
