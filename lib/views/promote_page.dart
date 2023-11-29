import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/fields_content.dart';
import 'package:naijabatternew/widgets/previous_page_icon.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
import '../views/listeditems_promote_page.dart';

class PromotePageView extends ConsumerWidget {
  const PromotePageView({super.key});

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
              const Center(
                child: Image(
                  image: AssetImage(
                    'images/promote_illustration.png',
                  ),
                ),
              ),
              const SizedBox12(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 62.0),
                child: Text(
                  "Create more awareness and increase sales with our hot deals and flash sale",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(
                "12 slots remaining",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
              ),
              const SizedBox10(),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ListedItemsforPromotePage(
                      pageName: "hotdeals",
                    );
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    themeIsLight
                        ? const Color(0xFFCF1920)
                        : const Color(0xFF962226),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 44.0,
                      vertical: 16.0,
                    ),
                  ),
                ),
                child: Text(
                  "Hot Deals Placement",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    color: themeIsLight
                        ? const Color(0xFFFFFFFF)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 50.0,
              // ),
              // Text(
              //   "2 slots remaining",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 10.0,
              //     fontFamily: 'Roboto',
              //     fontWeight: FontWeight.w400,
              //     color: themeIsLight
              //         ? const Color(0xFF000000)
              //         : ProjectColors.bigTxtWhite,
              //   ),
              // ),
              // const SizedBox10(),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return const ListedItemsforPromotePage(
              //           pageName: "flashsale");
              //     }));
              //   },
              //   style: ButtonStyle(
              //     backgroundColor: MaterialStateProperty.all<Color>(
              //       themeIsLight
              //           ? const Color(0xFF618FFA)
              //           : const Color(0xFF5974B5),
              //     ),
              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5.0),
              //       ),
              //     ),
              //     padding: MaterialStateProperty.all(
              //       const EdgeInsets.symmetric(
              //         horizontal: 44.0,
              //         vertical: 16.0,
              //       ),
              //     ),
              //   ),
              //   child: Text(
              //     "Flash Sale Placement",
              //     style: TextStyle(
              //       fontSize: 22.0,
              //       fontFamily: 'Roboto',
              //       fontWeight: FontWeight.w600,
              //       color: themeIsLight
              //           ? const Color(0xFFFFFFFF)
              //           : ProjectColors.bigTxtWhite,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
