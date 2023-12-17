import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/fonts.dart';
import 'package:naijabatternew/utilities/lists/category_list.dart';
import 'package:naijabatternew/utilities/lists/location_list.dart';
import 'package:naijabatternew/utilities/lists/search_keywords_list.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/filter_search_tabs.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';

import '../widgets/searchpage_constants.dart';

class SearchFilterScreen extends ConsumerStatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  ConsumerState<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends ConsumerState<SearchFilterScreen> {
  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    // var screenHeight = MediaQuery.of(context).size.height;

    List<FilterSearchTab> locationsList = List.generate(
      locationList.length,
      (index) {
        return FilterSearchTab(
          text: locationList[index],
        );
      },
    );

    List<FilterSearchTab> productCategoriesList = List.generate(
      categoryList.length,
      (index) {
        return FilterSearchTab(
          text: categoryList[index],
        );
      },
    );

    // List<InlineSpan> searchKeywords = List.generate(
    //   searchKeywordsList.length,
    //   (index) {
    //     return TextSpan(text: "${searchKeywordsList[index]} ");
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Filter Search",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
            fontSize: 18,
          ),
        ),
        titleSpacing: 5,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 10,
        ),
        children: [
          // Row(
          //   children: [
          //     const Text("Search Keywords: "),
          //     Wrap(
          //       spacing: 8.0,
          //       runSpacing: 10.0,
          //       children: searchKeywords,
          //     ),
          //   ],
          // ),
          // RichText(
          //   text: TextSpan(
          //     text: "Search Keywords: ",
          //     style: const TextStyle(color: Colors.black),
          //     // children: searchKeywords,
          //     children: searchKeywords.map((keyword) {
          //     return TextSpan(text: "$keyword ");
          //   }).toList(),
          //   ),
          // ),
          const SizedBox(height: 10),
          const SearchTitle(
            text: 'Location',
          ),
          const SizedBox10(),

          Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            children: locationsList,
          ),

          const SizedBox28(),

          const SearchTitle(
            text: 'Category',
          ),
          const SizedBox10(),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 1,
          //   itemBuilder: (BuildContext context, int index) {
          // List<FilterSearchTab> locationsList = List.generate(
          //   locationList.length,
          //   (index) {
          //     return FilterSearchTab(
          //       text: locationList[index],
          //       color: Colors.grey[400]!,
          //     );
          //   },
          // );
          //     return Flexible(
          //       child: Wrap(
          //         spacing: 8.0,
          //         runSpacing: 10.0,
          //         children: locationsList,
          //       ),
          //     );
          //   },
          // ),

          Wrap(
            spacing: 8.0,
            runSpacing: 10.0,
            children: productCategoriesList,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: themeIsLight ? Colors.white : ProjectColors.darkThemeBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    searchKeywordsList.clear();
                    print(searchKeywordsList);
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: themeIsLight
                            ? Colors.black
                            : ProjectColors.bigTxtWhite,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: robotoFontName,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              // flex: 2,
              child: SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ProjectColors.darkThemeBlue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: robotoFontName,
                      fontSize: 16,
                    ),
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
