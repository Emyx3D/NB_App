import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/provider/product.dart';
import 'package:naijabatternew/widgets/empty.dart';
import 'package:naijabatternew/widgets/indicator_dot.dart';

import '../views/accesibility_page.dart';
import '../views/more_product_description.dart';
import '../widgets/advert_content.dart';
import '../widgets/barter_scroll_card.dart';
import '../widgets/declutter_scroll_card.dart';
import '../widgets/fields_content.dart';
import '../widgets/flash_sales_card.dart';
import '../widgets/gift_scroll_card.dart';
import '../widgets/pages_header.dart';

class HomePageView extends ConsumerStatefulWidget {
  const HomePageView({
    super.key,
  });

  @override
  ConsumerState<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends ConsumerState<HomePageView> {
  final List<String> _images = [
    "images/cokead.png",
    "images/cokead.png",
    "images/cokead.png",
    "images/cokead.png",
  ];

  late PageController _pageController;

  late Timer _timer;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    var screenWidth = MediaQuery.of(context).size.width;

    final titleStyle = TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: themeIsLight ? Colors.black : const Color(0xD1FFFFFF),
    );

    return Scaffold(
      appBar: const PagesHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // const PagesHeader(),
            const SizedBox(
              height: 14.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Barter',
                      style: titleStyle,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final products = ref.read(barterProduct.future);

                      return FutureBuilder(
                        future: products,
                        builder: (context, controller) {
                          if (!controller.hasData) {
                            return const Text('Loading...');
                          }
                          if (controller.data!.isEmpty) {
                            return const EmptyCard();
                          }
                          return Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 11,
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.data!.length,
                              itemBuilder: (context, index) => BarterScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            baseImage +
                                                controller.data![index].image,
                                          ),
                                          productName:
                                              controller.data![index].name,
                                          location: controller
                                              .data![index].location.state,
                                          expectedExchange:
                                              controller.data![index].exchange,
                                          productDescription: controller
                                              .data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  baseImage + controller.data![index].image,
                                ),
                                productName: controller.data![index].name,
                                location:
                                    controller.data![index].location.state,
                                expectedExchange:
                                    controller.data![index].exchange,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // const SizedBox15(),
            // const AdvertContent(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: screenWidth,
                    height: 60,
                    child: PageView.builder(
                      itemCount: _images.length,
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      itemBuilder: (context, index) => Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _images.length,
                      (index) => IndicatorDot(
                        isActive: index == _currentIndex,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xCE0F29A9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'AD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox12(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0),
              child: BarterFlashSaleCard(
                image: AssetImage('images/heels.jpg'),
                productName: "Fridda de laba Gucci Pumps 6 inches",
                location: "Lagos",
                expectedExchange: "Hermes Bag",
              ),
            ),

            // const SizedBox(
            //   height: 11.0,
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 42.0,
            //   alignment: Alignment.center,
            //   color: const Color(0xFF0857BF),
            //   child: const Text(
            //     'Sweet Deals',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 16.0,
            //       fontWeight: FontWeight.w600,
            //       fontFamily: 'Nunito',
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 2.0,
            // ),
            // Container(
            //   child: homepageStackProductsGrid(),
            // ),

            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Declutter',
                      style: titleStyle,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final products = ref.watch(declutterProduct.future);

                      return FutureBuilder(
                        future: products,
                        builder: (context, controller) {
                          if (!controller.hasData) {
                            return const Text('Loading...');
                          }
                          if (controller.data!.isEmpty) {
                            return const EmptyCard();
                          }
                          return Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 11,
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.data!.length,
                              itemBuilder: (context, index) =>
                                  DeclutterScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            baseImage +
                                                controller.data![index].image,
                                          ),
                                          productName:
                                              controller.data![index].name,
                                          location: controller
                                              .data![index].location.state,
                                          expectedExchange:
                                              controller.data![index].exchange,
                                          productDescription: controller
                                              .data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  baseImage + controller.data![index].image,
                                ),
                                productName: controller.data![index].name,
                                location:
                                    controller.data![index].location.state,
                                price:
                                    '₦${formattedPrice(controller.data![index].price)}',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            const AdvertContent(),
            const SizedBox12(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0),
              child: DeclutterFlashsalesCard(
                image: AssetImage('images/lens.jpg'),
                productName: "Canon Camera Lens",
                location: "Port-Hacourt",
                oldPrice: "₦185,000",
                newPrice: "₦80,000",
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 11.0,
              ),
              // padding: const EdgeInsets.only(left: 11.0, right: 11.0,), //remove the right later
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Gift",
                      style: titleStyle,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final products = ref.watch(giftProduct.future);

                      return FutureBuilder(
                        future: products,
                        builder: (context, controller) {
                          if (!controller.hasData) {
                            return const Text('Loading...');
                          }
                          if (controller.data!.isEmpty) {
                            return const EmptyCard();
                          }
                          return Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width - 11,
                            alignment: Alignment.centerLeft,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.data!.length,
                              itemBuilder: (context, index) => GiftScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            baseImage +
                                                controller.data![index].image,
                                          ),
                                          productName:
                                              controller.data![index].name,
                                          location: controller
                                              .data![index].location.state,
                                          expectedExchange:
                                              controller.data![index].exchange,
                                          productDescription: controller
                                              .data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  baseImage + controller.data![index].image,
                                ),
                                productName: controller.data![index].name,
                                location:
                                    controller.data![index].location.state,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
