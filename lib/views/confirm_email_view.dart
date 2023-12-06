import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/user/signup.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/register_view.dart';
import '../widgets/fields_content.dart';

class ConfirmEmailPage extends ConsumerWidget {
  ConfirmEmailPage({super.key});
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupProvider = ref.watch(signup);
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final loadingSignupProvider = ref.watch(loadingSignup);

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
              isLoading: loadingSignupProvider,
              onPressed: () async {
                await signupProvider.confirmEmail(context, otpController.text);
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
