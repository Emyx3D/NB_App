import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/utilities/provider/user/user.dart';
import 'package:naijabatternew/widgets/empty.dart';
import 'package:naijabatternew/widgets/fields_content.dart';
import 'package:naijabatternew/widgets/profile_info.dart';
import 'package:naijabatternew/widgets/profilepage_stack_products_grid.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../views/edit_profile_screen.dart';
import '../views/promote_page.dart';
import '../views/settings_view.dart';
// import '../views/upgradenow_declutter_premium_view.dart';

class BusinessProfileView extends ConsumerWidget {
  const BusinessProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final userProvider = ref.watch(userNotifier);
    // bool isPremiumVisible = true;

    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
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
          Column(
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
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(userProvider.image),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userProvider.name,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: themeIsLight
                          ? const Color(0xFF000000)
                          : ProjectColors.bigTxtWhite,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(
                    Icons.verified_rounded,
                    size: 15,
                    color: Color(0xFF0F28A9),
                  ),
                ],
              ),
            ],
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
          Consumer(
            builder: (context, ref, child) {
              final userProductCountProvider = ref.watch(userProductCount);

              return userProductCountProvider.when(
                data: (data) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileInfos(
                      title: 'Gift',
                      total: data['gift'] ?? 0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35.0),
                      width: 1.0,
                      height: 65.0, // Adjust the height as needed
                      color: themeIsLight
                          ? Colors.black
                          : ProjectColors
                              .bigTxtWhite, // Set the color of the line
                    ),
                    ProfileInfos(
                      title: 'Declutter',
                      total: data['declutter'] ?? 0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35.0),
                      width: 1.0,
                      height: 65.0, // Adjust the height as needed
                      color: themeIsLight
                          ? Colors.black
                          : ProjectColors.bigTxtWhite,
                    ),
                    ProfileInfos(
                      title: 'Barter',
                      total: data['barter'] ?? 0,
                    )
                  ],
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Text('Loading...'),
              );
            },
          ),
          const SizedBox(
            height: 13.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 45.0,
                    child: OutlinedButton(
                      onPressed: () {},
                      // style: ButtonStyle(
                      //   backgroundColor:
                      //       MaterialStateProperty.all<Color>(Colors.white),
                      //   shape:
                      //       MaterialStateProperty.all<RoundedRectangleBorder>(
                      //     RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //       side: const BorderSide(
                      //         width: 1.0,
                      //         color: Color(0xFF0F28A9),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                  flex: 2,
                  child: SizedBox(
                    height: 45.0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PromotePageView();
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(
                            0xFF618FFA,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Promote",
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
                const SizedBox(
                  width: 9.0,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 45.0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const EditBusinessProfilePage();
                        }));
                      },
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
          Consumer(
            builder: (context, ref, child) {
              final products = ref.watch(userProduct);
              return products.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const EmptyCard();
                    }
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                      ),
                      child: profilepageStackProductsGrid(data),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Text('Loading...'));
            },
          )
        ],
      ),
    );
  }
}

// Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 5,
//                   child: SizedBox(
//                     height: 45.0,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return const EditBusinessProfilePage();
//                         }));
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(
//                             0xFF0F28A9,
//                           ),
//                         ),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                         ),
//                       ),
//                       child: const Text(
//                         "Edit",
//                         style: TextStyle(
//                           fontSize: 19.0,
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w600,
//                           color: Color(0xFFFFFFFF),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 6,
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: SizedBox(
//                     height: 45.0,
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 const DeclutterPremiumUpgradeNowView(),
//                           ),
//                         );
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(
//                             0xFFF1AE02,
//                           ),
//                         ),
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Get Premium",
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF000000),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 3,
//                           ),
//                           FaIcon(
//                             FontAwesomeIcons.crown,
//                             size: 14,
//                             color: Colors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
