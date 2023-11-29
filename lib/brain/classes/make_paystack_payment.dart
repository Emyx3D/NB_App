// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:naijabatternew/brain/paystack_public_key.dart';
// import 'package:naijabatternew/utilities/colors.dart';
// import 'package:naijabatternew/utilities/fonts.dart';
// import 'package:naijabatternew/views/homeview_page.dart';

// class MakePayment {
//   final BuildContext ctx;
//   final int price;
//   final String email;

//   MakePayment({required this.ctx, required this.price, required this.email});

//   PaystackPlugin paystack = PaystackPlugin();
//   String message = "";

//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }

//     return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
//   }

//   PaymentCard _getCardUI() {
//     return PaymentCard(
//         number: null, cvc: null, expiryMonth: null, expiryYear: null);
//   }

//   Future initializePlugin() async {
//     await paystack.initialize(publicKey: ConstantKey.paystackPublicKey);
//   }

//   chargeCardAndMakePayment() async {
//     initializePlugin().then((_) async {
//       Charge charge = Charge()
//         ..amount = price * 100
//         ..email = email //Replace this with the business email from the database
//         ..currency = "NGN"
//         ..accessCode = '12345'
//         ..reference = _getReference()
//         ..card = _getCardUI();

//       CheckoutResponse response = await paystack.checkout(
//         ctx,
//         charge: charge,
//         method: CheckoutMethod.selectable,
//         fullscreen: true,
//         logo: Image.asset(
//           "images/nblogo.png",
//           width: 50,
//           height: 50,
//         ),
//       );

//       if (response.status == true) {
//         message = "Payment was successful. Ref: ${response.reference}";
//         print(message);

//         // if (mounted) {
//         //   ScaffoldMessenger.of(ctx).showSnackBar(
//         //     SnackBar(
//         //       backgroundColor: ProjectColors.mainBlue,
//         //       content: Text(
//         //         message,
//         //         style: const TextStyle(
//         //           color: Colors.white,
//         //           fontFamily: interFontName,
//         //         ),
//         //       ),
//         //     ),
//         //   );

//         //   Navigator.pushAndRemoveUntil(
//         //     ctx,
//         //     MaterialPageRoute(builder: (context) {
//         //       return const HomePageView();
//         //     }),
//         //     (route) => false,
//         //   );
//         // }
//       } else {
//         print(response.message);

//         // if (mounted) {
//         //   ScaffoldMessenger.of(ctx).showSnackBar(
//         //     const SnackBar(
//         //       backgroundColor: Colors.red,
//         //       content: Text(
//         //         "Transaction Failed",
//         //         style: TextStyle(
//         //           color: Colors.white,
//         //           fontFamily: interFontName,
//         //         ),
//         //       ),
//         //     ),
//         //   );
//         // }
//       }
//     });
//   }
// }
