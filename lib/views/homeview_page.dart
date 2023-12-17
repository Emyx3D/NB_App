import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/colors.dart';
import 'package:naijabatternew/utilities/helper/helper.dart';
import 'package:naijabatternew/utilities/provider/product/product.dart';
import 'package:naijabatternew/utilities/provider/promotion/promotion.dart';
import 'package:naijabatternew/widgets/advert_content_slider.dart';
import 'package:naijabatternew/widgets/empty.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollGiftController.dispose();
    scrollGiftController.removeListener(() {});

    scrollBarterController.dispose();
    scrollBarterController.removeListener(() {});

    scrollDeclutterController.dispose();
    scrollDeclutterController.removeListener(() {});
    super.dispose();
  }

  final scrollGiftController = ScrollController();
  final scrollBarterController = ScrollController();
  final scrollDeclutterController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    // barter
    final barterProductProvider = ref.watch(barterProduct);
    final loadingBarterProvider = ref.watch(loadingBarter);
    scrollBarterController.addListener(() => ref
        .watch(barterProduct.notifier)
        .fetchScrollListener(scrollBarterController));
    // declutter
    final declutterProductProvider = ref.watch(declutterProduct);
    final loadingDeclutterProvider = ref.watch(loadingDeclutter);
    scrollDeclutterController.addListener(() => ref
        .watch(declutterProduct.notifier)
        .fetchScrollListener(scrollDeclutterController));
    // gift
    final giftProductProvider = ref.watch(giftProduct);
    final loadingGiftProvider = ref.watch(loadingGift);
    scrollGiftController.addListener(() => ref
        .watch(giftProduct.notifier)
        .fetchScrollListener(scrollGiftController));

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
                  FutureBuilder(
                    future: barterProductProvider,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Loading...');
                      }
                      if (snapshot.hasError) {
                        return const Text('Error occured');
                      }
                      if (snapshot.data!.isEmpty) {
                        return const EmptyCard();
                      }
                      return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 11,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            controller: scrollBarterController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == snapshot.data!.length) {
                                if (loadingBarterProvider) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CircularProgressIndicator(
                                        color: ProjectColors.errorColor,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }
                              return BarterScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            snapshot.data![index].images[0],
                                          ),
                                          productName:
                                              snapshot.data![index].name,
                                          location: snapshot
                                              .data![index].location.state,
                                          expectedExchange:
                                              snapshot.data![index].exchange,
                                          productDescription:
                                              snapshot.data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  snapshot.data![index].images[0],
                                ),
                                productName: snapshot.data![index].name,
                                location: snapshot.data![index].location.state,
                                expectedExchange:
                                    snapshot.data![index].exchange,
                              );
                            }),
                      );
                    },
                  ),
                ],
              ),
            ),
            // const SizedBox15(),
            const AdvertContentsSlider(),

            const SizedBox12(),

            Consumer(builder: (context, ref, child) {
              final barterProductPromotionProvider =
                  ref.watch(barterProductPromotion);
              return barterProductPromotionProvider.when(
                data: (data) {
                  if (data == null) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: BarterFlashSaleCard(
                      promotionExpiresAtHm: data.promotionExpiresAtHm,
                      image: NetworkImage(data.images[0]),
                      productName: data.name,
                      location: data.location.state,
                      expectedExchange: data.exchange,
                    ),
                  );
                },
                error: (error, stackTrace) => const Text('Error occured'),
                loading: () => const Text('Loading...'),
              );
            }),

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
                  FutureBuilder(
                    future: declutterProductProvider,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Loading...');
                      }
                      if (snapshot.hasError) {
                        return const Text('Error occured');
                      }
                      if (snapshot.data!.isEmpty) {
                        return const EmptyCard();
                      }
                      return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 11,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            controller: scrollDeclutterController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == snapshot.data!.length) {
                                if (loadingDeclutterProvider) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CircularProgressIndicator(
                                        color: ProjectColors.errorColor,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }
                              return DeclutterScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            snapshot.data![index].images[0],
                                          ),
                                          productName:
                                              snapshot.data![index].name,
                                          location: snapshot
                                              .data![index].location.state,
                                          expectedExchange:
                                              snapshot.data![index].exchange,
                                          productDescription:
                                              snapshot.data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  snapshot.data![index].images[0],
                                ),
                                productName: snapshot.data![index].name,
                                location: snapshot.data![index].location.state,
                                price:
                                    '₦${formattedPrice(snapshot.data![index].price)}',
                              );
                            }),
                      );
                    },
                  ),
                ],
              ),
            ),

            const AdvertContent(),
            const SizedBox12(),
            Consumer(builder: (context, ref, child) {
              final declutterProductPromotionProvider =
                  ref.watch(declutterProductPromotion);
              return declutterProductPromotionProvider.when(
                data: (data) {
                  if (data == null) {
                    return const SizedBox();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: DeclutterFlashsalesCard(
                      promotionExpiresAtHm: data.promotionExpiresAtHm,
                      image: NetworkImage(data.images[0]),
                      productName: data.name,
                      location: data.location.state,
                      oldPrice: data.price.toString(),
                      newPrice: data.promotionPrice.toString(),
                    ),
                  );
                },
                error: (error, stackTrace) => const Text('Error occured'),
                loading: () => const Text('Loading...'),
              );
            }),
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
                  FutureBuilder(
                    future: giftProductProvider,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text('Loading...');
                      }
                      if (snapshot.hasError) {
                        return const Text('Error occured');
                      }
                      if (snapshot.data!.isEmpty) {
                        return const EmptyCard();
                      }
                      return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 11,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            controller: scrollGiftController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == snapshot.data!.length) {
                                if (loadingGiftProvider) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: CircularProgressIndicator(
                                        color: ProjectColors.errorColor,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              }
                              return GiftScrollCard(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductDescriptionView(
                                          image: NetworkImage(
                                            snapshot.data![index].images[0],
                                          ),
                                          productName:
                                              snapshot.data![index].name,
                                          location: snapshot
                                              .data![index].location.state,
                                          expectedExchange:
                                              snapshot.data![index].exchange,
                                          productDescription:
                                              snapshot.data![index].description,
                                        );
                                      },
                                    ),
                                  );
                                },
                                image: NetworkImage(
                                  snapshot.data![index].images[0],
                                ),
                                productName: snapshot.data![index].name,
                                location: snapshot.data![index].location.state,
                              );
                            }),
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
