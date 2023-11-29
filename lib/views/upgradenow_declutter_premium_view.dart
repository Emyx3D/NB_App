import 'package:flutter/material.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../views/declutter_upgrade_page.dart';

class DeclutterPremiumUpgradeNowView extends StatelessWidget {
  const DeclutterPremiumUpgradeNowView({super.key});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 42.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'images/Component1.png',
                      ),
                    ),
                    const SizedBox34(),
                    const Text(
                      'Sell faster',
                      style: descTextStyle,
                    ),
                    const SizedBox19(),
                    const Text(
                      'Get two free hot deals placement weekly',
                      style: descTextStyle,
                    ),
                    const SizedBox19(),
                    const Text(
                      'Reach more people',
                      style: descTextStyle,
                    ),
                    const SizedBox19(),
                    const Text(
                      'Get a verification tick',
                      style: descTextStyle,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Center(
                      child: SizedBox(
                        width: 245,
                        height: 51,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const DeclutterUpgradePage(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1.0,
                                          0.0), // Starting position of the slide animation
                                      end: Offset
                                          .zero, // Ending position of the slide animation
                                    ).animate(animation),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF0F28A9),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Upgrade Now',
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
