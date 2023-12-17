import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/widgets/promotepage_product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget promoteProductsGrid(List<Product> product, BuildContext context) {
  return ResponsiveGridRow(
    children: product
        .map(
          (item) => ResponsiveGridCol(
            xs: 4,
            md: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
              alignment: Alignment.center,
              child: PromotePageProductCard(
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
}
