import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/profile_info.dart';
import 'package:naijabatternew/widgets/profilepage_stack_products_grid.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/settings_view.dart';

class PersonalProfileView extends ConsumerWidget {
  const PersonalProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    int totalNumberOfGifts = 20;
    int totalNumberOfDeclutter = 14;
    int totalNumberOfBarter = 9;

    // bool isPremiumVisible = false;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 27.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: FaIcon(
                  FontAwesomeIcons.gear,
                  size: 25,
                  color:
                      themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SettingsPage(
                  //       premiumIsVisible: isPremiumVisible,
                  //     ),
                  //   ),
                  // );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: themeIsLight
                        ? const Color(0xFF242760)
                        : const Color(0xFF373972),
                    width: 1.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/gojo.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 24,
                child: Icon(
                  Icons.photo_camera,
                  color: themeIsLight
                      ? const Color(0xFF0F28A9)
                      : const Color(0xFF373972),
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            'Gojo Satoru',
            style: TextStyle(
              fontSize: 15.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              color: themeIsLight
                  ? const Color(0xFF000000)
                  : ProjectColors.bigTxtWhite,
            ),
          ),
          const SizedBox12(),
          Text(
            'Transactions',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: themeIsLight
                  ? const Color(0xFF000000)
                  : ProjectColors.bigTxtWhite,
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileInfos(
                title: 'Gift',
                total: totalNumberOfGifts,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                width: 1.0,
                height: 65.0, // Adjust the height as needed
                color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
              ),
              ProfileInfos(
                title: 'Declutter',
                total: totalNumberOfDeclutter,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                width: 1.0,
                height: 65.0, // Adjust the height as needed
                color: themeIsLight ? Colors.black : ProjectColors.bigTxtWhite,
              ),
              ProfileInfos(
                title: 'Barter',
                total: totalNumberOfBarter,
              ),
            ],
          ),
          const SizedBox(
            height: 13.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 45.0,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBlue,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Icon(
                        Icons.bookmarks_outlined,
                        color: themeIsLight
                            ? const Color(0xFF0F28A9)
                            : ProjectColors.darkThemeBlue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9.0,
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 45.0,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          themeIsLight
                              ? const Color(0xFF0F28A9)
                              : ProjectColors.darkThemeBlue,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 19.0,
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
          ),
          const SizedBox(
            height: 17.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: profilepageStackProductsGrid(),
          ),
        ],
      ),
    );
  }
}
