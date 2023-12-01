import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/change_password_screen.dart';
import 'package:naijabatternew/views/help_screen.dart';
import 'package:naijabatternew/views/language_screen.dart';
import 'package:naijabatternew/views/privacy_settings_screen.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../widgets/setting_button.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/login_view.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  // final bool premiumIsVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 6, right: 20, left: 20),
          child: Column(
            children: [
              SettingsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const PrivacySettingsScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Duration(microseconds: 100);
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves
                                  .easeInOut, // You can choose a different curve if needed
                              reverseCurve: Curves
                                  .easeInOut, // You can choose a different reverse curve if needed
                            ),
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: FontAwesomeIcons.userShield,
                text: 'Privacy settings',
              ),
              SettingsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ChangePasswordScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Duration(microseconds: 100);
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves
                                  .easeInOut, // You can choose a different curve if needed
                              reverseCurve: Curves
                                  .easeInOut, // You can choose a different reverse curve if needed
                            ),
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: FontAwesomeIcons.key,
                text: 'Change Password',
              ),
              SettingsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const LanguageScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Duration(microseconds: 100);
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves
                                  .easeInOut, // You can choose a different curve if needed
                              reverseCurve: Curves
                                  .easeInOut, // You can choose a different reverse curve if needed
                            ),
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: FontAwesomeIcons.earthAmericas,
                text: 'Language',
              ),
              SettingsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const AccessibilityView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const Duration(microseconds: 100);
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves
                                  .easeInOut, // You can choose a different curve if needed
                              reverseCurve: Curves
                                  .easeInOut, // You can choose a different reverse curve if needed
                            ),
                          ),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                icon: FontAwesomeIcons.universalAccess,
                text: 'Accessibility',
              ),
              const SizedBox15(),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HelpScreen();
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Help",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // contentPadding: const EdgeInsets.all(5),
                          title: const Text(
                            'Are you sure you want to logout?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // content: Text(
                          //   "Are you sure you want to promote this item?",
                          //   style: TextStyle(
                          //     fontSize: 16.0,
                          //     fontFamily: 'Nunito',
                          //     fontWeight: FontWeight.w600,
                          //     color: themeIsLight
                          //         ? const Color(0xFF000000)
                          //         : ProjectColors.bigTxtWhite,
                          //   ),
                          // ),
                          // actionsAlignment: MainAxisAlignment.center,
                          actionsPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xFF0F28A9),
                                  fontFamily: robotoFontName,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const LoginView();
                                  }),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFFE81515),
                                  fontFamily: robotoFontName,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add acount",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Delete account",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: themeIsLight
                        ? const Color(0xFFE81515)
                        : const Color(0xFF962A2A),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
