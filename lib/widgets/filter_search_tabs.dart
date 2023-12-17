import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/lists/search_keywords_list.dart';
import 'package:naijabatternew/views/accesibility_page.dart';
import 'package:naijabatternew/views/search_page.dart';

class FilterSearchTab extends ConsumerStatefulWidget {
  const FilterSearchTab({
    super.key,
    required this.text,
  });
  final String text;

  @override
  ConsumerState<FilterSearchTab> createState() => _FilterSearchTabState();
}

class _FilterSearchTabState extends ConsumerState<FilterSearchTab> {
  // bool tabIsSelected = false;

  // void toggleTab() {
  //   setState(() {
  //     tabIsSelected = !tabIsSelected;
  //     print(tabIsSelected);
  //   });
  // }

  // Color toggleColor() {
  //   if (tabIsSelected = true) {
  //     return ProjectColors.mainBlue;
  //   } else {
  //     return const Color(0xFFB5CBFF);
  //   }
  // }
  var tabIsSelected = false;
  void toggleTabs() {
    // setState(() {
    //   ref.watch(searchFilterTabProvider.notifier).state = !ref.watch(searchFilterTabProvider.notifier).state;
    // });
    setState(() {
      tabIsSelected = !tabIsSelected;
    });

    // if (tabIsSelected) {
    //     tabIsSelected = false;
    // } else {
    //     tabIsSelected = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final themeIsLight = ref.watch(themeProvider.notifier).state;
    // var screenWidth = MediaQuery.of(context).size.width;
    // var tabIsSelected = ref.watch(searchFilterTabProvider.notifier).state;

    return GestureDetector(
      onTap: () {
        // setState(() {
        //   tabIsSelected = !tabIsSelected;
        // });
        setState(() {
          toggleTabs();

        print(tabIsSelected);

          if (tabIsSelected == true) {
          setState(() {
            searchKeywordsList.add(widget.text);
          });
          print(searchKeywordsList);
        } else if (tabIsSelected == false) {
          setState(() {
            searchKeywordsList.remove(widget.text);
          });
          print(searchKeywordsList);
        }
        });

        
      },
      child: Container(
        decoration: BoxDecoration(
          // color: themeIsLight ? const Color(0xFA0857BF) : const Color(0xFF29398C),
          color:
              tabIsSelected ? ProjectColors.mainBlue : const Color(0xFFB5CBFF),
          // color: toggleColor(),
          borderRadius: BorderRadius.circular(3.0),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
        padding: const EdgeInsets.only(
          top: 9,
          bottom: 9,
          left: 10,
          right: 8,
        ),
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            // color: themeIsLight
            //     ? const Color(0xF1FFFFFF)
            //     : ProjectColors.bigTxtWhite,
            color:
                tabIsSelected ? ProjectColors.bigTxtWhite : Colors.grey[900]!,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
