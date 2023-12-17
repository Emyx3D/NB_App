import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/widgets/messaging_product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget messagingProductsGrid(List<Product> product, BuildContext context) {
  ResponsiveGridRow messageProductRow = ResponsiveGridRow(
    children: product
        .map(
          (item) => ResponsiveGridCol(
            xs: 4,
            md: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
              alignment: Alignment.center,
              child: MessagingProductCard(
                expectedExchange: item.theTrade(),
                productDescription: item.description,
                image: NetworkImage(item.images[0]),
                productName: item.name,
                productLocation: item.location.state,
                productType: item.productType,
              ),
            ),
          ),
        )
        .toList(),
  );

  return messageProductRow;
}
