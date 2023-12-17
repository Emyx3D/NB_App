import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/views/more_product_description.dart';
import 'package:naijabatternew/widgets/product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget productsGrid(List<Product> products, BuildContext context) {
  return ResponsiveGridRow(
    children: products
        .map(
          (item) => ResponsiveGridCol(
            xs: 4,
            md: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductDescriptionView(
                        product: item,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
                alignment: Alignment.center,
                child: ProductCard(
                  image: NetworkImage(item.images[0]),
                  productName: item.name,
                  productLocation: item.location.state,
                  trade: item.theTrade(inPromo: true),
                  tradeNarrative: item.theTradeNarrative(),
                  eeisVisible: true,
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}
