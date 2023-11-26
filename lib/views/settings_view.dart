import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/fields_content.dart';
import '../constants/setting_button.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/login_view.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  // final bool premiumIsVisible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              PreviousPageIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Column(
                children: [
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 20, right: 20, top: 22.0),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Visibility(
                  //       visible: premiumIsVisible,
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //             context,
                  //             PageRouteBuilder(
                  //               pageBuilder:
                  //                   (context, animation, secondaryAnimation) =>
                  //                       const DeclutterPremiumUpgradeNowView(),
                  //               transitionsBuilder: (context, animation,
                  //                   secondaryAnimation, child) {
                  //                 const Duration(microseconds: 100);
                  //                 return SlideTransition(
                  //                   position: Tween<Offset>(
                  //                     begin: const Offset(1.0, 0.0),
                  //                     end: Offset.zero,
                  //                   ).animate(
                  //                     CurvedAnimation(
                  //                       parent: animation,
                  //                       curve: Curves
                  //                           .easeInOut, // You can choose a different curve if needed
                  //                       reverseCurve: Curves
                  //                           .easeInOut, // You can choose a different reverse curve if needed
                  //                     ),
                  //                   ),
                  //                   child: child,
                  //                 );
                  //               },
                  //             ),
                  //           );
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.all(7.0),
                  //           width: 240.0,
                  //           height: 87.0,
                  //           decoration: BoxDecoration(
                  //               color: const Color(0xFFF1AE02),
                  //               borderRadius: BorderRadius.circular(5.0)),
                  //           child: const Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Text(
                  //                 "Upgrade your account",
                  //                 style: TextStyle(
                  //                   fontSize: 12.0,
                  //                   fontFamily: 'Roboto',
                  //                   fontWeight: FontWeight.w300,
                  //                   color: Color(0xFF231602),
                  //                 ),
                  //               ),
                  //               Text(
                  //                 "Get premium declutter\naccount today",
                  //                 style: TextStyle(
                  //                   fontSize: 18.0,
                  //                   fontFamily: 'Nunito',
                  //                   fontWeight: FontWeight.w700,
                  //                   color: Color(0xFF231602),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, right: 20, left: 20),
                    child: Column(
                      children: [
                        SettingsButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.userShield,
                          text: 'Privacy settings',
                        ),
                        SettingsButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.key,
                          text: 'Change Password',
                        ),
                        SettingsButton(
                          onPressed: () {},
                          icon: FontAwesomeIcons.earthAmericas,
                          text: 'Language',
                        ),
                        SettingsButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const AccessibilityView(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
