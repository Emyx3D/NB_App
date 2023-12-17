import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/widgets/fields_content.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';

class SalesCard extends ConsumerWidget {
  const SalesCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color:
              themeIsLight ? const Color(0xFF618FFA) : const Color(0xFF496096),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: themeIsLight
                          ? const Color(0xFF4074E9)
                          : const Color(0xFF5783EC),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    product.promotionExpiresAtHm,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                      color: themeIsLight
                          ? const Color(0xB2000000)
                          : const Color(0xB2FFFFFF),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Text(
                  "Flash Sale",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: themeIsLight
                        ? const Color(0xFF0F28A9)
                        : const Color(0xFF112EC0),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox15(),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: NetworkImage(product.images[0]),
                  height: 190.0,
                  width: 170.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        color: themeIsLight
                            ? const Color(0xFF000000)
                            : ProjectColors.bigTxtWhite,
                      ),
                    ),
                    const SizedBox10(),
                    Text(
                      "${product.location.state}, Nigeria",
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w500,
                        color: themeIsLight
                            ? const Color(0xB2000000)
                            : ProjectColors.smallTxtWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 62.0,
                    ),
                    Text(
                      product.theTradeNarrative(),
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w300,
                        color: themeIsLight
                            ? const Color(0xB2000000)
                            : ProjectColors.smallTxtWhite,
                      ),
                    ),
                    SizedBox(
                      height: product.theProductType == 3 ? 2 : 0,
                    ),
                    product.theProductType == 3
                        ? Text(
                            '₦${product.price}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12.0,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                              color: themeIsLight
                                  ? const Color(0xFF606060)
                                  : const Color(0xFFA0A0A0),
                            ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      product.theTrade(inPromo: true),
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w600,
                        color: themeIsLight
                            ? const Color(0xFF000000)
                            : ProjectColors.bigTxtWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
