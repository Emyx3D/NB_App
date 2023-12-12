import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/widgets/advert_content_slider.dart';
import 'package:naijabatternew/widgets/empty.dart';

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
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const SizedBox15(),
            Consumer(
              builder: (context, ref, child) {
                final products = ref.watch(hotDealsProduct);
                return products.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const EmptyCard();
                    }
                    final firstData = data[0];
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Image(
                              width: double.infinity,
                              height: 250.0,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: NetworkImage(firstData.image),
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
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Text('Loading...'),
                );
              },
            ),
            const AdvertContentsSlider(),
            const SizedBox(
              height: 8.0,
            ),
            Consumer(
              builder: (context, ref, child) {
                final products = ref.watch(hotDealsProduct);
                return products.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const EmptyCard();
                    }
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: productsGrid(data ?? []),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Text('Loading...'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
