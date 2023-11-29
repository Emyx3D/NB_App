import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/login_view.dart';

import '../utilities/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.mainBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/nb_row_white.png",
              width: double.infinity,
            ),
            Stack(
              children: [
                Image.asset("images/ng_dot_map.png"),
                const Positioned(
                  top: 0,
                  left: 0,
                  bottom: 15,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: interFontName,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              "Naija’s First barter and declutter space",
              style: TextStyle(
                color: Colors.white,
                fontFamily: interFontName,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              height: 59.0,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFFFFFFFF),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginView();
                  }));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
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
