import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/other/bookmark.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/homeview_page.dart';
import '../views/hotdeals_view.dart';
import '../views/middle_add_button.dart';
import '../views/profilepage_view.dart';
import '../views/search_page.dart';
import '../widgets/fields_content.dart';

class HomePage extends ConsumerStatefulWidget {
  final int currentIndex;

  const HomePage({super.key, this.currentIndex = 0});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isVisible = true;

  late PageController _pageController;
  int _currentIndex = 0;

  IconData middleIcon = Icons.add_rounded;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    if (_currentIndex == 0) {
      homebtnColor = kActiveColorBlue;
      searchbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      hotdealsbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      profilebtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      homebtnVisible = true;
      searchbtnVisible = false;
      hotdealsbtnVisible = false;
      profilebtnVisible = false;

      middleIcon = Icons.add_rounded;
    } else if (_currentIndex == 1) {
      homebtnColor = themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      searchbtnColor = kActiveColorBlue;
      hotdealsbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      profilebtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      homebtnVisible = false;
      searchbtnVisible = true;
      hotdealsbtnVisible = false;
      profilebtnVisible = false;

      middleIcon = Icons.add_rounded;
    } else if (_currentIndex == 2) {
      homebtnColor = themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      searchbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      hotdealsbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      profilebtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      homebtnVisible = false;
      searchbtnVisible = false;
      hotdealsbtnVisible = false;
      profilebtnVisible = false;

      middleIcon = Icons.close_rounded;
    } else if (_currentIndex == 3) {
      homebtnColor = themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      searchbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      hotdealsbtnColor = kActiveColorRed;
      profilebtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      homebtnVisible = false;
      searchbtnVisible = false;
      hotdealsbtnVisible = true;
      profilebtnVisible = false;

      middleIcon = Icons.add_rounded;
    } else if (_currentIndex == 4) {
      homebtnColor = themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      searchbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      hotdealsbtnColor =
          themeIsLight ? kInactiveColor : ProjectColors.bigTxtWhite;
      profilebtnColor = kActiveColorBlue;
      homebtnVisible = false;
      searchbtnVisible = false;
      hotdealsbtnVisible = false;
      profilebtnVisible = true;

      middleIcon = Icons.add_rounded;
    }

    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: const [
            HomePageView(),
            SearchPage(),
            AddProductPage(),
            // EditAndUploadProductsPage(),
            HotDealsPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: themeIsLight
                ? Colors.white
                : ProjectColors.darkThemeBottomNavColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 25.0,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    _navigateToPage(0);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        size: 30.0,
                        color: homebtnColor,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Visibility(
                        visible: homebtnVisible,
                        child: Text(
                          'Home',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: homebtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    _navigateToPage(1);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 30.0,
                        color: searchbtnColor,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Visibility(
                        visible: searchbtnVisible,
                        child: Text(
                          'Search',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: searchbtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _navigateToPage(2);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.radio_button_unchecked,
                        size: 55.0,
                        color: themeIsLight
                            ? Colors.black
                            : ProjectColors.bigTxtWhite,
                      ),
                      Positioned(
                        child: Icon(
                          Icons.radio_button_unchecked,
                          size: 35.0,
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors.bigTxtWhite,
                        ),
                      ),
                      Positioned(
                        child: Icon(
                          middleIcon,
                          size: 20.0,
                          color: themeIsLight
                              ? Colors.black
                              : ProjectColors.bigTxtWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    _navigateToPage(3);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        size: 30.0,
                        color: hotdealsbtnColor,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Visibility(
                        visible: hotdealsbtnVisible,
                        child: Text(
                          'Hot Deals',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: hotdealsbtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    _navigateToPage(4);
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_rounded,
                        size: 30.0,
                        color: profilebtnColor,
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      Visibility(
                        visible: profilebtnVisible,
                        child: Text(
                          'Profile',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: profilebtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
