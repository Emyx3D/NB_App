import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/widgets/fields_content.dart';

import '../widgets/previous_page_icon.dart';
import 'declutter_business_payment_forms_screen.dart';

class DeclutterBusinessPaymentScreen extends StatelessWidget {
  const DeclutterBusinessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/nblogo.png",
                width: 100,
              ),
              const SizedBox15(),
              Text(
                "Get Verified",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: interFontName,
                  fontWeight: FontWeight.w600,
                  color: ProjectColors.mainBlue,
                ),
              ),
              const SizedBox34(),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DeclutterBusinessPaymentForms();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ProjectColors.mainBlue,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Pay ₦1,500 / year",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: interFontName,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox10(),
              Text(
                "All Declutters account must be verified",
                style: TextStyle(
                  color: ProjectColors.mainBlue,
                  fontFamily: robotoFontName,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
