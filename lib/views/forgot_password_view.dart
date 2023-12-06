import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/user/forgot_password.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/register_view.dart';
import '../widgets/fields_content.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordProvider = ref.watch(forgotPassword);

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
            InputField(
              controller: emailController,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter Your Email Address',
              obscureText: false,
            ),
            const SizedBox19(),
            InputFieldButton(
              isLoading: forgotPasswordProvider.isLoading,
              onPressed: () async {
                print('i am in the btn oo');
                await forgotPasswordProvider.sendForgotPassword(
                    context, emailController.text);
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
