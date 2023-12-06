import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/user/forgot_password.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/register_view.dart';
import '../widgets/fields_content.dart';

class OTPEntryPage extends ConsumerWidget {
  OTPEntryPage({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordProvider = ref.watch(forgotPassword);
    final loadingForgotPasswordProvider = ref.watch(loadingForgotPassword);

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
              textInput: 'Enter OTP',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            const SizedBox28(),
            InputField(
              controller: otpController,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              hintText: 'OTP',
              obscureText: false,
              // maxLength: 6,
            ),
            const SizedBox19(),
            InputFieldButton(
              isLoading: loadingForgotPasswordProvider,
              onPressed: () async {
                await forgotPasswordProvider.sendForgotPassword(
                    context, otpController.text);
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
      ),
    );
  }
}
