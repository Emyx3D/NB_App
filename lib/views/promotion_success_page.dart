import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/homepage_view.dart';

class PromotionSuccessPage extends ConsumerWidget {
  const PromotionSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // PreviousPageIcon(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            const SizedBox(
              height: 80.0,
            ),
            const Image(
              image: AssetImage(
                "images/moonbound_illustration.png",
              ),
            ),
            const SizedBox15(),
            Text(
              "Moon Bound",
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
            const SizedBox(
              height: 23.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Congratulations, your promotion will be activated in 20 minutes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
              ),
            ),
            const SizedBox(
              height: 78.0,
            ),
            SizedBox(
              width: 275.0,
              height: 50.0,
              // alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   border: Border.all(
              //     color: const Color(0xFF0F28A9),
              //     width: 2,
              //   ),
              //   borderRadius: BorderRadius.circular(10.0),
              // ),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 2.0,
                    color: themeIsLight
                        ? const Color(0xFF0F28A9)
                        : ProjectColors.bigTxtWhite,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Return to Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                    color: themeIsLight
                        ? const Color(0xFF0F28A9)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
