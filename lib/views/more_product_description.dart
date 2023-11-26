import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/fields_content.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/listeditems_messaging_page.dart';

class ProductDescriptionView extends ConsumerWidget {
  const ProductDescriptionView(
      {super.key,
      required this.image,
      required this.productName,
      required this.location,
      this.expectedExchange,
      required this.productDescription,
      this.price});

  final ImageProvider image;
  final String productName;
  final String location;
  final String? expectedExchange;
  final String? price;
  final String productDescription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    // String title;
    Widget showWidget() {
      late Widget returnedWidget;
      if (expectedExchange != null) {
        returnedWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Expected Exchange",
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
              expectedExchange.toString(),
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ],
        );
      } else if (price != null) {
        returnedWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
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
              price.toString(),
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ],
        );
      } else if (price == null && expectedExchange == null) {
        returnedWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
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
              "Free",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: themeIsLight
                    ? const Color(0xFF000000)
                    : ProjectColors.bigTxtWhite,
              ),
            ),
          ],
        );
      }

      return returnedWidget;
    }

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
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: image,
                          width: double.infinity,
                          height: 220.0,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox15(),
                    Text(
                      productName,
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
                      "$location, Nigeria",
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
                      productDescription,
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
                    Container(
                      child: showWidget(),
                    ),
                    const SizedBox(
                      height: 51.0,
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        height: 49.0,
                        decoration: BoxDecoration(
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBlue,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Future.delayed(Duration.zero, () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: const Color(0xFFDEECFF),
                                      icon: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.close,
                                            size: 22.0,
                                            color: Color(0xFF0F28A9),
                                          ),
                                        ),
                                      ),
                                      iconPadding: const EdgeInsets.only(
                                        bottom: 15.0,
                                        right: 16.0,
                                        top: 16.0,
                                      ),
                                      // title: const Text(
                                      //   'Notice',
                                      //   textAlign: TextAlign.left,
                                      //   style: TextStyle(
                                      //     color: Color(0xFF0F28A9),
                                      //     fontSize: 15.0,
                                      //     fontFamily: "Roboto",
                                      //   ),
                                      // ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 40.0),
                                            child: Text(
                                              "Select an exchange item from your barter or upload a barter to proceed",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                          ),
                                          const SizedBox28(),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return const ListedItemsforMessaging();
                                                    }));
                                                  },
                                                  child: const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 114.0,
                                                        height: 141.0,
                                                        child: Card(
                                                          child: Image(
                                                            image: AssetImage(
                                                                "images/select_barter_illustration.png"),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7.0,
                                                      ),
                                                      Text(
                                                        "Select Barter",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xFF000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 21.0,
                                                ),
                                                const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 114.0,
                                                      height: 141.0,
                                                      child: Card(
                                                        child: Image(
                                                          image: AssetImage(
                                                              "images/upload_barter_illustration.png"),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7.0,
                                                    ),
                                                    Text(
                                                      "Upload Barter",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox26(),
                                        ],
                                      ),
                                      // actions: <Widget>[
                                      //   TextButton(
                                      //     onPressed: () =>
                                      //         Navigator.pop(context, 'Cancel'),
                                      //     child: const Text(
                                      //       'Cancel',
                                      //       style: TextStyle(
                                      //         color: Color(0xFF0F28A9),
                                      //       ),
                                      //     ),
                                      //   ),
                                      //   TextButton(
                                      //     onPressed: () {
                                      //       Navigator.of(context).pop();
                                      //       // Navigator.push(context,
                                      //       //     MaterialPageRoute(builder: (context) {
                                      //       //   return const PromotionSuccessPage();
                                      //       // }));
                                      //     },
                                      //     child: const Text(
                                      //       'Sure',
                                      //       style: TextStyle(
                                      //         color: Color(0xFF0F28A9),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ],
                                    );
                                  });
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Message",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  color: themeIsLight
                                      ? Colors.white
                                      : ProjectColors.bigTxtWhite,
                                ),
                              ),
                              const SizedBox(
                                width: 18.0,
                              ),
                              Icon(
                                Icons.send_rounded,
                                size: 20.0,
                                color: themeIsLight
                                    ? Colors.white
                                    : ProjectColors.bigTxtWhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 10.0,
                    // ),
                    // Expanded(
                    // child: Container(
                    //   height: 46.0,
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFF0F28A9),
                    //     borderRadius: BorderRadius.circular(5.0),
                    //   ),
                    //     child: TextButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         "Upload",
                    //         style: TextStyle(
                    //           fontSize: 20.0,
                    //           fontFamily: 'Roboto',
                    //           fontWeight: FontWeight.w600,
                    //           color: Color(0xFFFFFFFF),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
