import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/app_brain.dart';
import 'package:naijabatternew/constants/fields_content.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/views/login_view.dart';

class PersonalForm extends ConsumerStatefulWidget {
  const PersonalForm({super.key});

  @override
  ConsumerState<PersonalForm> createState() => _PersonalFormState();
}

class _PersonalFormState extends ConsumerState<PersonalForm> {
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
        const SizedBox15(),
        const InputFieldButton(buttonText: 'Sign Up'),
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
        const SizedBox15(),
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight - keyboardHeight,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    PreviousPageIcon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox165(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FormHeaderText(
                            textInput: 'Declutter Business Only',
                            color: themeIsLight
                                ? Colors.black
                                : ProjectColors.bigTxtWhite,
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
                          const InputFieldButton(buttonText: 'Sign Up'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
