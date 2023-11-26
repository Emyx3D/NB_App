import 'package:flutter/material.dart';
import '../constants/fields_content.dart';
import '../constants/pages_header.dart';
import '../constants/product_cards_grid.dart';
import '../constants/searchpage_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 26.0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          width: 295.0,
                          child: TextFormField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeIsLight
                                      ? const Color(0xFF4054BA)
                                      : ProjectColors.bigTxtWhite,
                                  width: 2.0,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(55.0),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 22.0,
                                vertical: 17.0,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 14.5,
                                color: themeIsLight
                                    ? const Color(0x61000000)
                                    : ProjectColors.bigTxtWhite,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w900,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: themeIsLight
                                      ? const Color(0xFF4054BA)
                                      : ProjectColors.bigTxtWhite,
                                  width: 1.5,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(55.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.tune,
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors.bigTxtWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox19(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SearchTitle(
                        text: 'Search History',
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 10.0,
                          children: [
                            SearchTab(
                              text: 'Nike Shoes',
                            ),
                            SearchTab(
                              text: 'Bicycle',
                            ),
                            SearchTab(
                              text: 'Dell Laptop',
                            ),
                            SearchTab(
                              text: 'Umbrella',
                            ),
                            SearchTab(
                              text: 'Zealot Headphones',
                            ),
                            SearchTab(
                              text: 'Rubik\'s Cube',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox26(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchTitle(
                        text: 'Discover',
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Wrap(
                    //     spacing: 8.0,
                    //     runSpacing: 10.0,
                    //     children: const [
                    //       SearchTab(
                    //         text: 'Puzzle',
                    //       ),
                    //       SearchTab(
                    //         text: 'Board Game',
                    //       ),
                    //       SearchTab(
                    //         text: 'Guitar',
                    //       ),
                    //       SearchTab(
                    //         text: 'Fitness Tracker',
                    //       ),
                    //       SearchTab(
                    //         text: 'Headphones',
                    //       ),
                    //       SearchTab(
                    //         text: 'Keychain',
                    //       ),
                    //       SearchTab(
                    //         text: 'Wallets',
                    //       ),
                    //       SearchTab(
                    //         text: 'Laptops',
                    //       ),
                    //       SearchTab(
                    //         text: 'Books',
                    //       ),
                    //       SearchTab(
                    //         text: 'Watches',
                    //       ),
                    //       SearchTab(
                    //         text: 'Cameras',
                    //       ),
                    //       SearchTab(
                    //         text: 'Backpacks',
                    //       ),
                    //       SearchTab(
                    //         text: 'Sunglasses',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: productsGrid(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
