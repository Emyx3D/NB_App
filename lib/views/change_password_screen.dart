import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/app_brain.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/utilities/provider/user/signup.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider = ref.watch(signup);
    final loadingForgotPasswordProvider = ref.watch(loadingSignup);
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            fontSize: 18,
          ),
        ),
        titleSpacing: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: poppinsFontName,
                      fontSize: 11,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: oldPasswordController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    cursorColor: themeIsLight
                        ? const Color(0xFF4054BA)
                        : ProjectColors.darkThemeBorderColor,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: obscureText3,
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
                          Radius.circular(10.0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 10.0,
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
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Icon(
                            obscureText3
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 22,
                          ),
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBorderColor,
                          onPressed: () {
                            setState(() {
                              toggle3();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    "New Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: poppinsFontName,
                      fontSize: 11,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: newPasswordController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    cursorColor: themeIsLight
                        ? const Color(0xFF4054BA)
                        : ProjectColors.darkThemeBorderColor,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: obscureText4,
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
                          Radius.circular(10.0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 10.0,
                      ),
                      hintText: 'New Password',
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
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Icon(
                            obscureText4
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 22,
                          ),
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBorderColor,
                          onPressed: () {
                            setState(
                              () {
                                toggle4();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: poppinsFontName,
                      fontSize: 11,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    cursorColor: themeIsLight
                        ? const Color(0xFF4054BA)
                        : ProjectColors.darkThemeBorderColor,
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: obscureText5,
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
                          Radius.circular(10.0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 10.0,
                      ),
                      hintText: 'Confirm Password',
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
                          Radius.circular(10.0),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Icon(
                            obscureText5
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 22,
                          ),
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBorderColor,
                          onPressed: () {
                            setState(
                              () {
                                toggle5();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InputFieldButton(
              buttonText: "Set Password",
              onPressed: () async {
                await forgotPasswordProvider.changePassword(context,
                    oldPasswordController.text, newPasswordController.text);
              },
              isLoading: loadingForgotPasswordProvider,
            ),
          ],
        ),
      ),
    );
  }
}
