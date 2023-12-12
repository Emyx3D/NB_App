import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/colors.dart';
import '../views/accesibility_page.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.productName,
    required this.productLocation,
    required this.trade,
    required this.eeisVisible,
    required this.tradeNarrative,
  });

  final ImageProvider image;
  final String productName;
  final String productLocation;
  final String trade;
  final bool eeisVisible;
  final String tradeNarrative;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeProvider.notifier).state;

    double? sbHeight;

    if (eeisVisible == true) {
      sbHeight = 0.0;
    } else {
      sbHeight = 8.0;
    }

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: themeIsLight
            ? Colors.white
            : ProjectColors
                .darkThemeCardColor, // You can set the container color here
        borderRadius: BorderRadius.circular(
            2.0), // Optional: To add rounded corners to the container
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // Shadow color
            blurRadius: 4, // Spread of the shadow from the container
            spreadRadius:
                0, // Optional: How far the shadow extends from the box (negative values will shrink the shadow)
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2.0),
                child: Image(
                  image: image,
                  width: 100.0,
                  height: 83.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 100.0,
                child: Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                    color: themeIsLight
                        ? const Color(0xFF000000)
                        : ProjectColors.bigTxtWhite,
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
                child: Text(
                  productLocation,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 8.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    color: themeIsLight
                        ? const Color(0xB2000000)
                        : ProjectColors.smallTxtWhite,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sbHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: eeisVisible,
                child: Text(
                  tradeNarrative,
                  style: TextStyle(
                    fontSize: 6.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w300,
                    color: themeIsLight
                        ? const Color(0xB2000000)
                        : ProjectColors.smallTxtWhite,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Text(
                trade,
                style: TextStyle(
                  fontSize: 9.0,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  color: themeIsLight
                      ? const Color(0xFF000000)
                      : ProjectColors.bigTxtWhite,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
