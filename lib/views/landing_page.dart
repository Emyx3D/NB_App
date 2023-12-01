import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/login_view.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/landing_page_carousel_items_slides.dart';

import '../utilities/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double currentPage = 0.0;
  String _buttonText = "Skip";

  final _pageViewController = PageController();

  List<Widget> indicator() => List<Widget>.generate(slides.length, (index) {
        if (currentPage.round() == slides.length - 1) {
          setState(() {
            _buttonText = "Next";
          });
        } else {
          setState(() {
            _buttonText = "Skip";
          });
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: currentPage.round() == index
                      ? ProjectColors.mainBlue
                      : const Color(0xFFACACAC),
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                height: 9.0,
                width: 9.0,
                decoration: BoxDecoration(
                  color: currentPage.round() == index
                      ? ProjectColors.mainBlue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page!;
                  });
                });
                return slides[index];
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginView();
                            }),
                            (route) => false,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            ProjectColors.mainBlue,
                          ),
                        ),
                        child: Text(
                          _buttonText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: interFontName,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ProjectColors.mainBlue,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 36.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
            // Image.asset(
            //   "images/nb_row_white.png",
            //   width: double.infinity,
            // ),
            // Stack(
            //   children: [
            //     Image.asset("images/ng_dot_map.png"),
            //     const Positioned(
            //       top: 0,
            //       left: 0,
            //       bottom: 15,
            //       right: 0,
            //       child: Align(
            //         alignment: Alignment.center,
            //         child: Text(
            //           "Welcome",
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 25,
            //             fontFamily: interFontName,
            //             fontWeight: FontWeight.w800,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
//             const Text(
//               "Naija’s first Barter and Declutter Space",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: interFontName,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 59.0,
//               child: TextButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     const Color(0xFFFFFFFF),
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(13.0),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return const LoginView();
//                   }));
//                 },
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(
//                     fontFamily: "Roboto",
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
