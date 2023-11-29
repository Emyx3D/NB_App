import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/advert_content.dart';
import '../widgets/pages_header.dart';
import '../widgets/product_cards_grid.dart';
import '../views/accesibility_page.dart';
import '../utilities/colors.dart';
// import 'package:responsive_grid_list/responsive_grid_list.dart';

class HotDealsPage extends ConsumerWidget {
  const HotDealsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const SizedBox15(),
            Stack(
              children: [
                Column(
                  children: [
                    const Image(
                      width: double.infinity,
                      height: 250.0,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: AssetImage('images/television.jpg'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7.0, vertical: 7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PlasmaEdge 58-Inch Ultra HD Television',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto',
                                color: themeIsLight
                                    ? const Color(0xFF000000)
                                    : ProjectColors.bigTxtWhite,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lagos',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: themeIsLight
                                    ? const Color(0xB2000000)
                                    : ProjectColors.smallTxtWhite,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Declutter | ₦120,000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: themeIsLight
                                    ? const Color(0xB2000000)
                                    : ProjectColors.smallTxtWhite,
                                fontSize: 9.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: -50,
                  top: 25,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(-45 / 360),
                    child: Container(
                      color: const Color(0xFFCF1920),
                      width: 180,
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Hottest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const AdvertContent(),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: productsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
