import 'package:flutter/material.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/widgets/product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget productsGrid(List<Product> products) {
  return ResponsiveGridRow(
    children: products
        .map(
          (item) => ResponsiveGridCol(
            xs: 4,
            md: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
              alignment: Alignment.center,
              child: ProductCard(
                image: NetworkImage(baseImage + item.image),
                productName: item.name,
                productLocation: item.location.state,
                productType: item.productType,
                eeisVisible: true,
              ),
            ),
          ),
        )
        .toList(),
  );
}
