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
    scrollController.dispose();
    scrollController.removeListener(() {});
    super.dispose();
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;
    final giftProductProvider = ref.watch(giftProduct);
    final loadingGiftProvider = ref.watch(loadingGift);

    scrollController.addListener(() =>
        ref.watch(giftProduct.notifier).fetchScrollListener(scrollController));

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
                      final products = ref.watch(barterProduct);
                      return products.when(
                          data: (data) => Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width - 11,
                                alignment: Alignment.centerLeft,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) =>
                                      BarterScrollCard(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ProductDescriptionView(
                                              image: NetworkImage(
                                                data[index].images[0],
                                              ),
                                              productName: data[index].name,
                                              location:
                                                  data[index].location.state,
                                              expectedExchange:
                                                  data[index].exchange,
                                              productDescription:
                                                  data[index].description,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    image: NetworkImage(
                                      data[index].images[0],
                                    ),
                                    productName: data[index].name,
                                    location: data[index].location.state,
                                    expectedExchange: data[index].exchange,
                                  ),
                                ),
                              ),
                          error: (error, stackTrace) => Text(error.toString()),
                          loading: () => const Text('Loading...'));
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
                error: (error, stackTrace) => Text(error.toString()),
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
                  Consumer(
                    builder: (context, ref, child) {
                      final products = ref.watch(declutterProduct);
                      return products.when(
                          data: (data) => Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width - 11,
                                alignment: Alignment.centerLeft,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) =>
                                      DeclutterScrollCard(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ProductDescriptionView(
                                              image: NetworkImage(
                                                data[index].images[0],
                                              ),
                                              productName: data[index].name,
                                              location:
                                                  data[index].location.state,
                                              expectedExchange:
                                                  data[index].exchange,
                                              productDescription:
                                                  data[index].description,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    image: NetworkImage(
                                      data[index].images[0],
                                    ),
                                    productName: data[index].name,
                                    location: data[index].location.state,
                                    price:
                                        '₦${formattedPrice(data[index].price)}',
                                  ),
                                ),
                              ),
                          error: (error, stackTrace) => Text(error.toString()),
                          loading: () => const Text('Loading...'));
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
                error: (error, stackTrace) => Text(error.toString()),
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
                        return Text(snapshot.error.toString());
                      }
                      if (snapshot.data!.isEmpty) {
                        return const EmptyCard();
                      }
                      return Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 11,
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                            controller: scrollController,
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
