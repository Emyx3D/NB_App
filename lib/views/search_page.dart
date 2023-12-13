import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/widgets/empty.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

import '../utilities/colors.dart';
import '../utilities/lists/search_history_list.dart';
import '../views/accesibility_page.dart';
import '../widgets/fields_content.dart';
import '../widgets/pages_header.dart';
import '../widgets/product_cards_grid.dart';
import '../widgets/searchpage_constants.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer(
          builder: (context, ref, child) {
            var products = ref.watch(searchProductNotify);
            return Column(
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
                              // width: 295.0,
                              child: TextFormField(
                                onChanged: (value) {
                                  ref
                                      .read(searchProductNotify.notifier)
                                      .search(value);
                                },
                                controller: searchController,
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
                            child: GestureDetector(
                              onTap: () {
                                showFlexibleBottomSheet(
                                  minHeight: 0,
                                  initHeight: 0.5,
                                  maxHeight: 0.5,
                                  context: context,
                                  builder: _searchFilterBottomSheet,
                                  isExpand: false,
                                );
                              },
                              child: Icon(
                                Icons.tune,
                                color: themeIsLight
                                    ? Colors.black
                                    : ProjectColors.bigTxtWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox19(),
                     Padding(
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
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Wrap(
                          //     spacing: 8.0,
                          //     runSpacing: 10.0,
                          //     children: [
                          //       SearchTab(
                          //         text: 'Nike Shoes',
                          //       ),
                          //       SearchTab(
                          //         text: 'Bicycle',
                          //       ),
                          //       SearchTab(
                          //         text: 'Dell Laptop',
                          //       ),
                          //       SearchTab(
                          //         text: 'Umbrella',
                          //       ),
                          //       SearchTab(
                          //         text: 'Zealot Headphones',
                          //       ),
                          //       SearchTab(
                          //         text: 'Rubik\'s Cube',
                          //       ),
                          //     ],
                          //   ),
                          // ),


                          ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          List<SearchTab> searchTabsList = List.generate(
                            searchHistoryList.length,
                            (index) {
                              return SearchTab(
                                text: searchHistoryList[index],
                                onPressed: () {
                                  setState(() {
                                    searchHistoryList
                                        .remove(searchHistoryList[index]);
                                  });
                                },
                              );
                            },
                          );

                          return Wrap(
                            spacing: 8.0,
                            runSpacing: 10.0,
                            children: searchTabsList,
                          );
                        },
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
                        FutureBuilder(
                          future: Future(() => products),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text('Loading...');
                            }
                            if (snapshot.data!.isEmpty) {
                              return const EmptyCard();
                            }
                            return Container(
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: productsGrid(snapshot.data ?? []),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _searchFilterBottomSheet(
  BuildContext context,
  ScrollController scrollController,
  double bottomSheetOffset,
) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    child: const Column(
      children: [
        Text("Filter Search"),
      ],
    ),
  );
}
