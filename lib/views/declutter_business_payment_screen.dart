
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:naijabatternew/brain/paystack_public_key.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/homepage_view.dart';
import 'package:naijabatternew/widgets/fields_content.dart';

import '../widgets/previous_page_icon.dart';

class DeclutterBusinessPaymentScreen extends StatefulWidget {
  const DeclutterBusinessPaymentScreen({super.key});

  @override
  State<DeclutterBusinessPaymentScreen> createState() =>
      _DeclutterBusinessPaymentScreenState();
}

class _DeclutterBusinessPaymentScreenState
    extends State<DeclutterBusinessPaymentScreen> {
  final plugin = PaystackPlugin();
  String message = "";
  final int _price = 1500;
  String email = "ikennaunegbu10@gmail.com"; //Test email

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: ConstantKey.paystackPublicKey);
  }

  void makePayment() async {
    int price = _price * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = "ref_${DateTime.now()}"
      ..email = email
      ..currency = "NGN";

    CheckoutResponse response = await plugin.checkout(
      context,
      charge: charge,
      logo: Image.asset(
        "images/nblogo.png",
        width: 50,
        height: 50,
      ),
      method: CheckoutMethod.card,
      fullscreen: true,
    );

    if (response.status == true) {
      message = "Payment was successful. Ref: ${response.reference}";

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ProjectColors.mainBlue,
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: interFontName,
              ),
            ),
          ),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const HomePage();
          }),
          (route) => false,
        );
      }
    } else {
      print(response.message);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Transaction Failed",
              style: TextStyle(
                color: Colors.white,
                fontFamily: interFontName,
              ),
            ),
          ),
        );
      }
    }
  }

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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return const DeclutterBusinessPaymentForms();
                    // }));

                    makePayment();
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




  // final PaystackPlugin paystack = PaystackPlugin();
  // final int _price = 1500;
  // String email = "ikennaunegbu10@gmail.com"; //Test email
  // String message = "";

  // @override
  // void initState() {
  //   super.initState();
  //   paystack.initialize(publicKey: ConstantKey.paystackPublicKey);
  // }

  // String _getReference() {
  //   String platform;
  //   if (Platform.isIOS) {
  //     platform = 'iOS';
  //   } else {
  //     platform = 'Android';
  //   }

  //   return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  // }

  // void makePayment() async {
  //   int finalPrice = _price * 100;
  //   Charge charge = Charge()
  //     ..amount = finalPrice
  //     ..reference = _getReference()
  //     ..accessCode = "12345"
  //     ..email = email //Replace this with the business email from the database
  //     ..currency = "NGN";

  //   CheckoutResponse response = await paystack.checkout(
  //     context,
  //     charge: charge,
  // logo: Image.asset(
  //   "images/nblogo.png",
  //   width: 50,
  //   height: 50,
  // ),
  //     method: CheckoutMethod.selectable,
  //     fullscreen: true,
  //   );

  // if (response.status == true) {
  //   message = "Payment was successful. Ref: ${response.reference}";

  //   if (mounted) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: ProjectColors.mainBlue,
  //         content: Text(
  //           message,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontFamily: interFontName,
  //           ),
  //         ),
  //       ),
  //     );

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) {
  //         return const HomePageView();
  //       }),
  //       (route) => false,
  //     );
  //   }
  // } else {
  //   print(response.message);

  //   if (mounted) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(
  //           "Transaction Failed",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontFamily: interFontName,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
  // }
