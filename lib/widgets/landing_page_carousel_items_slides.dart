import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';

List items = [
  {
    "description":
        "Give away your unused items or receive free gifts from others by registering on the platform, promoting a culture of shared generosity.",
    "feature": "GIFT",
    "image": "images/ldGiftIllustration2.svg"
  },
  {
    "description":
        "Swap items effortlessly on our platform! Post what you have and what you're looking for, or check out offers from others to find the perfect exchange.",
    "feature": "BARTER",
    "image": "images/ldBarterIllustration2.svg"
  },
  {
    "description":
        "Explore discounted treasures from verified declutter businesses on our platform! Each account is authenticated by our admin for a secure shopping experience.",
    "feature": "DECLUTTER",
    "image": "images/ldDeclutterIllustration2.svg"
  },
];

List<Widget> slides = items
    .map(
      (item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // const SizedBox(
            //   height: 100.0,
            // ),
            Image.asset(
              "images/nb_row_black.png",
              // width: 300,
            ),
            Stack(
              children: [
                Image.asset(
                  "images/ng_dot_map.png",
                  width: 180,
                  height: 180,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 15,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      item["feature"],
                      style: TextStyle(
                        color: ProjectColors.mainBlue,
                        fontSize: 16,
                        fontFamily: interFontName,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              item["image"],
              width: 500,
              height: 250,
              // fit: BoxFit.fitHeight,
            ),
            // Image.asset(
            //   item['image'],
            //   // fit: BoxFit.contain,
            //   // width: 250.0,
            //   // alignment: Alignment.bottomCenter,
            // ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item['description'],
              style: const TextStyle(
                fontSize: 13.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    )
    .toList();
