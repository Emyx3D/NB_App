import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class EditAndUploadProductsPage extends ConsumerWidget {
  const EditAndUploadProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        'images/iphone.jpg',
                        width: double.infinity,
                        height: 220.0,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  const SizedBox15(),
                  Text(
                    "iPhone X",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Lagos, Nigeria",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Powered by a lightning-fast processor, this iPhone ensures swift performance, allowing you to multitask effortlessly. Stay connected and enjoy lightning-fast downloads with 5G connectivity, while the extensive battery life keeps you powered up throughout the day. Experience the future of mobile technology with the iPhone, where power, style, and performance unite in a single iconic device.",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "₦800,000",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 53.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 46.0,
                          // decoration: BoxDecoration(
                          //   color: const Color(0xFFFFFFFF),
                          //   border: Border.all(
                          //     width: 2.0,
                          //     color: const Color(0xFF0F28A9),
                          //   ),
                          //   borderRadius: BorderRadius.circular(5.0),
                          // ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2.0,
                                color: themeIsLight
                                    ? const Color(0xFF0F28A9)
                                    : ProjectColors.darkThemeBlue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: themeIsLight
                                    ? const Color(0xFF0F28A9)
                                    : ProjectColors.darkThemeBlue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 46.0,
                          decoration: BoxDecoration(
                            color: themeIsLight
                                ? const Color(0xFF0F28A9)
                                : ProjectColors.darkThemeBlue,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Upload",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: themeIsLight
                                    ? const Color(0xFFFFFFFF)
                                    : ProjectColors.bigTxtWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
