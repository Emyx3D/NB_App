import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.homebtnColor,
    required this.searchbtnColor,
    required this.hotdealsbtnColor,
    required this.profilebtnColor,
    required this.homebtnVisible,
    required this.searchbtnVisible,
    required this.hotdealsbtnVisible,
    required this.profilebtnVisible,
    this.homebtnOnPressed,
    this.searchbtnOnPressed,
    this.hotdealsbtnOnPressed,
    this.profilebtnOnPressed,
    this.middleplusbtnOnPressed,
  });

  final Color homebtnColor;
  final Color searchbtnColor;
  final Color hotdealsbtnColor;
  final Color profilebtnColor;
  final bool homebtnVisible;
  final bool searchbtnVisible;
  final bool hotdealsbtnVisible;
  final bool profilebtnVisible;
  final void Function()? homebtnOnPressed;
  final void Function()? searchbtnOnPressed;
  final void Function()? hotdealsbtnOnPressed;
  final void Function()? profilebtnOnPressed;
  final void Function()? middleplusbtnOnPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Container(
      height: 70.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color:
            themeIsLight ? Colors.white : ProjectColors.darkThemeBottomNavColor,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image(
                //   image: AssetImage('images/homeBlue.png'),
                // ),
                // FaIcon(
                //   FontAwesomeIcons.house,
                //   size: 20.0,
                //   color: homebtnColor,
                // ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.home_rounded,
                    size: 30.0,
                    color: homebtnColor,
                  ),
                  onPressed: homebtnOnPressed,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Visibility(
                  visible: homebtnVisible,
                  child: Text(
                    'Home',
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.search_rounded,
                    size: 30.0,
                    color: searchbtnColor,
                  ),
                  onPressed: searchbtnOnPressed,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Visibility(
                  visible: searchbtnVisible,
                  child: Text(
                    'Search',
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
          // const Image(
          //   image: AssetImage('images/searchBlack.png'),
          // ),

          Expanded(
            child: GestureDetector(
              onTap: middleplusbtnOnPressed,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.radio_button_unchecked,
                    size: 55.0,
                    color:
                        themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
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
                      Icons.add_rounded,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.local_fire_department_rounded,
                    size: 30.0,
                    color: hotdealsbtnColor,
                  ),
                  onPressed: hotdealsbtnOnPressed,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Visibility(
                  visible: hotdealsbtnVisible,
                  child: Text(
                    'Hot Deals',
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    Icons.person_rounded,
                    size: 30.0,
                    color: profilebtnColor,
                  ),
                  onPressed: profilebtnOnPressed,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Visibility(
                  visible: profilebtnVisible,
                  child: Text(
                    'Profile',
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
        ],
      ),
    );
  }
}
