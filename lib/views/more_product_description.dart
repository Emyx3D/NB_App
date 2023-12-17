import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/listeditems_messaging_page.dart';
import '../widgets/fields_content.dart';

class ProductDescriptionView extends ConsumerWidget {
  const ProductDescriptionView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
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
                height: 10.0,
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
                          image: NetworkImage(product.images[0]),
                          width: double.infinity,
                          height: 220.0,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    const SizedBox15(),
                    Text(
                      product.name,
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
                      "${product.location.state}, Nigeria",
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
                      product.description,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.theTradeNarrative(),
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
                            product.theTrade(),
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
                      ),
                    ),
                    const SizedBox(
                      height: 51.0,
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        height: 49.0,
                        decoration: BoxDecoration(
                          color: (themeIsLight
                                  ? const Color(0xFF0F28A9)
                                  : ProjectColors.darkThemeBlue)
                              .withOpacity(
                                  product.userId == getUserOrNa().id ? 0.5 : 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: product.userId == getUserOrNa().id
                            ? TextButton(
                                onPressed: null,
                                child: Text(
                                  "Your Product",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    color: themeIsLight
                                        ? Colors.white
                                        : ProjectColors.bigTxtWhite,
                                  ),
                                ),
                              )
                            : TextButton(
                                onPressed: () {
                                  Future.delayed(Duration.zero, () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor:
                                                const Color(0xFFDEECFF),
                                            icon: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Align(
                                                alignment:
                                                    Alignment.centerRight,
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
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox28(),
                                                Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
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
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xFF000000),
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xFF000000),
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
