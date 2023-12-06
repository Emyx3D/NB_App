import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/app_brain.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/provider/user/signup.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/views/declutter_business_payment_screen.dart';
import 'package:naijabatternew/views/login_view.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

class PersonalForm extends ConsumerStatefulWidget {
  const PersonalForm({super.key});

  @override
  ConsumerState<PersonalForm> createState() => _PersonalFormState();
}

class _PersonalFormState extends ConsumerState<PersonalForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final signupProvider = ref.watch(signup);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputField(
          controller: nameController,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.text,
          hintText: 'Full Name',
          obscureText: false,
        ),
        const SizedBox15(),
        InputField(
          controller: phoneController,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.phone,
          hintText: 'Phone Number',
          obscureText: false,
        ),
        const SizedBox15(),
        InputField(
          controller: usernameController,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.text,
          hintText: 'Username',
          obscureText: false,
        ),
        const SizedBox15(),
        InputField(
          controller: emailController,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email Address',
          obscureText: false,
        ),
        const SizedBox15(),
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
                padding: const EdgeInsets.all(0),
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
        const SizedBox12(),
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _checkboxValue,
                fillColor: MaterialStateProperty.all(
                  ProjectColors.mainBlue,
                ),
                checkColor: ProjectColors.bigTxtWhite,
                splashRadius: 0,
                side: BorderSide.none,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),

            // const SizedBox(
            //   // width: MediaQuery.sizeOf(context).width,
            //   width: 280,
            //   child: Text(
            //     "I agree to the Citadel Terms and conditions and Privacy Policy",
            //     softWrap: true,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: readexproFontName,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),

            SizedBox(
              width: 280,
              child: RichText(
                text: TextSpan(
                  text: "I agree to the NaijaBarter ",
                  style: TextStyle(
                    color: themeIsLight
                        ? ProjectColors.darkThemeBgColor
                        : ProjectColors.bigTxtWhite,
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms and conditions ",
                      style: TextStyle(
                        color: ProjectColors.mainBlue,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(
                        color: themeIsLight
                            ? ProjectColors.darkThemeBgColor
                            : ProjectColors.bigTxtWhite,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: ProjectColors.mainBlue,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox12(),
        InputFieldButton(
            isLoading: signupProvider.isLoading,
            onPressed: () async {
              await signupProvider.signupUser(
                context,
                emailController.text,
                usernameController.text,
                passwordController.text,
                nameController.text,
                phoneController.text,
              );
            },
            buttonText: 'Sign Up'),
        const SizedBox15(),
        BottomInputRow(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
          },
          blackText: 'Already have an account? ',
          buttonText: 'Sign In',
        ),
      ],
    );
  }
}

class BusinessForm extends ConsumerStatefulWidget {
  const BusinessForm({super.key});

  @override
  ConsumerState<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends ConsumerState<BusinessForm> {
  void navigateToForm2() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BusinessForm2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const InputField(
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.text,
          hintText: 'Full Name',
          obscureText: false,
        ),
        const SizedBox15(),
        const InputField(
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.phone,
          hintText: 'Phone Number',
          obscureText: false,
        ),
        const SizedBox15(),
        const InputField(
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.text,
          hintText: 'Username',
          obscureText: false,
        ),
        const SizedBox15(),
        const InputField(
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          hintText: 'Email Address',
          obscureText: false,
        ),
        const SizedBox15(),
        TextFormField(
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
                padding: const EdgeInsets.all(0),
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
        const SizedBox12(),
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: _checkboxValue,
                fillColor: MaterialStateProperty.all(
                  ProjectColors.mainBlue,
                ),
                checkColor: ProjectColors.bigTxtWhite,
                splashRadius: 0,
                side: BorderSide.none,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),

            // const SizedBox(
            //   // width: MediaQuery.sizeOf(context).width,
            //   width: 280,
            //   child: Text(
            //     "I agree to the Citadel Terms and conditions and Privacy Policy",
            //     softWrap: true,
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: readexproFontName,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),

            SizedBox(
              width: 280,
              child: RichText(
                text: TextSpan(
                  text: "I agree to the NaijaBarter ",
                  style: TextStyle(
                    color: themeIsLight
                        ? ProjectColors.darkThemeBgColor
                        : ProjectColors.bigTxtWhite,
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms and conditions ",
                      style: TextStyle(
                        color: ProjectColors.mainBlue,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(
                        color: themeIsLight
                            ? ProjectColors.darkThemeBgColor
                            : ProjectColors.bigTxtWhite,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: ProjectColors.mainBlue,
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox12(),
        SizedBox(
          width: double.infinity,
          height: 59.0,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF0F28A9),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                ),
              ),
            ),
            onPressed: navigateToForm2,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    backgroundColor: Color(0xFF0F28A9),
                    fontSize: 18.0,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox15(),
        BottomInputRow(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
          },
          blackText: 'Already have an account? ',
          buttonText: 'Sign In',
        ),
      ],
    );
  }
}

class BusinessForm2 extends ConsumerStatefulWidget {
  const BusinessForm2({super.key});

  @override
  ConsumerState<BusinessForm2> createState() => _BusinessForm2State();
}

class _BusinessForm2State extends ConsumerState<BusinessForm2> {
  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height;
    // final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            FormHeaderText(
              textInput: 'Declutter Business Only',
              color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            ),
            const SizedBox26(),
            const InputField(
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.text,
              hintText: 'Business Name',
              obscureText: false,
            ),
            const SizedBox15(),
            const InputField(
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.text,
              hintText: 'Registration No.',
              obscureText: false,
            ),
            const SizedBox15(),
            const InputField(
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.text,
              hintText: 'Location',
              obscureText: false,
            ),
            const SizedBox15(),
            InputFieldButton(
              buttonText: 'Proceed to Payment',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DeclutterBusinessPaymentScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
