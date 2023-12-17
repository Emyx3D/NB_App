import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/views/accesibility_page.dart';

class NoInternetWarningWidget extends ConsumerWidget {
  const NoInternetWarningWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "images/warning_illus.svg",
              width: screenWidth / 1.95,
              // width: 200,
              // height: 200,
            ),
            Text(
              "Please check your internet connection",
              style: TextStyle(
                fontSize: 14,
                fontFamily: interFontName,
                fontWeight: FontWeight.w500,
                color: themeIsLight
                    ? ProjectColors.darkThemeBgColor
                    : ProjectColors.bigTxtWhite,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  ProjectColors.mainBlue,
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.refresh_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "Retry",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: interFontName,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
