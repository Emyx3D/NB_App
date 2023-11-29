import 'package:flutter/material.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../views/chat_screen.dart';

class ListedItemsProductDescriptionView extends StatelessWidget {
  const ListedItemsProductDescriptionView(
      {super.key,
      required this.image,
      required this.productName,
      required this.location,
      this.expectedExchange,
      required this.productDescription,
      this.price,
      required this.productType});

  final ImageProvider image;
  final String productName;
  final String location;
  final String? expectedExchange;
  final String? price;
  final String productDescription;
  final String productType;

  @override
  Widget build(BuildContext context) {
    // String title;
    Widget showWidget() {
      late Widget returnedWidget;
      // if (expectedExchange != null) {
      // returnedWidget = Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const Text(
      //       "Expected Exchange",
      //       style: TextStyle(
      //         fontSize: 12.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w400,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 2.0,
      //     ),
      //     Text(
      //       expectedExchange.toString(),
      //       style: const TextStyle(
      //         fontSize: 14.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w500,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //   ],
      // );
      // } else if (price != null) {
      // returnedWidget = Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const Text(
      //       "Price",
      //       style: TextStyle(
      //         fontSize: 12.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w400,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 2.0,
      //     ),
      //     Text(
      //       price.toString(),
      //       style: const TextStyle(
      //         fontSize: 14.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w500,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //   ],
      // );
      // } else if (price == null && expectedExchange == null) {
      // returnedWidget = const Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "Price",
      //       style: TextStyle(
      //         fontSize: 12.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w400,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 2.0,
      //     ),
      //     Text(
      //       "Free",
      //       style: TextStyle(
      //         fontSize: 14.0,
      //         fontFamily: 'Roboto',
      //         fontWeight: FontWeight.w500,
      //         color: Color(0xFF000000),
      //       ),
      //     ),
      //   ],
      // );
      // }

      if (productType == "Barter") {
        returnedWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Expected Exchange",
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              expectedExchange.toString(),
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
          ],
        );
      } else if (productType == "Declutter") {
        returnedWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Price",
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              price.toString(),
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
          ],
        );
      } else if (productType == "Gift") {
        returnedWidget = const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              "Free",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
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
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "$location, Nigeria",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      productDescription,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF000000),
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
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 49.0,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: Color(0xFF0F28A9),
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0F28A9),
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
                            alignment: Alignment.center,
                            height: 49.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F28A9),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ChatScreen(
                                        productName: productName,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                "Send Barter",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
