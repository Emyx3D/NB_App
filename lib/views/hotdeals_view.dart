import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/views/more_product_description.dart';
import 'package:naijabatternew/widgets/advert_content_slider.dart';
import 'package:naijabatternew/widgets/empty.dart';
import 'package:naijabatternew/widgets/fields_content.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';
import '../widgets/pages_header.dart';
import '../widgets/product_cards_grid.dart';
// import 'package:responsive_grid_list/responsive_grid_list.dart';

class HotDealsPage extends ConsumerStatefulWidget {
  const HotDealsPage({super.key});

  @override
  ConsumerState<HotDealsPage> createState() => _HotDealsPageState();
}

class _HotDealsPageState extends ConsumerState<HotDealsPage> {
  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final products = ref.watch(hotDealsProduct);
    final loadingHotDealsProductProvider = ref.watch(loadingHotDealsProduct);
    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const SizedBox15(),
            FutureBuilder(
              future: products,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ProjectColors.errorColor,
                    ),
                  );
                }
                if ((snapshot.data as List).isEmpty) {
                  return const EmptyCard();
                }
                final firstData = snapshot.data![0];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDescriptionView(
                            product: firstData,
                          );
                        },
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Image(
                            width: double.infinity,
                            height: 250.0,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: NetworkImage(firstData.images[0]),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7.0,
                              vertical: 7.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    firstData.name,
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
                                    firstData.location.state,
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
                                    ('${firstData.productType.toUpperCase()} | ') +
                                        (firstData.theTrade(inPromo: true)),
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
                );
              },
            ),
            const AdvertContentsSlider(),
            const SizedBox(
              height: 8.0,
            ),
            FutureBuilder(
              future: products,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ProjectColors.errorColor,
                    ),
                  );
                }
                if ((snapshot.data as List).isEmpty) {
                  return const EmptyCard();
                }
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: productsGrid(snapshot.data ?? [], context),
                    ),
                    const SizedBox10(),
                    loadingHotDealsProductProvider
                        ? const SizedBox()
                        : InkWell(
                            onTap: () =>
                                ref.read(hotDealsProduct.notifier).fetchMore(),
                            child: const Text('more'),
                          ),
                    const SizedBox10(),
                    loadingHotDealsProductProvider
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: CircularProgressIndicator(
                                color: ProjectColors.errorColor,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
