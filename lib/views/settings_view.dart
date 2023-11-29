import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naijabatternew/views/change_password_screen.dart';
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
              const SizedBox19(),
              Align(
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
              const SizedBox26(),
              Align(
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
              const SizedBox(
                height: 44.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginView();
                        },
                      ),
                    );
                  },
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
              const SizedBox26(),
              Align(
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
              const SizedBox26(),
              Align(
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
