import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
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
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormHeaderText(
              textInput: 'Forgot Password',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
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
    );
  }
}
