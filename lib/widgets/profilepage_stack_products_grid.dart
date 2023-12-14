import 'package:flutter/material.dart';
import 'package:naijabatternew/utilities/models/product.dart';
import 'package:naijabatternew/widgets/profile_page_imagebox.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget profilepageStackProductsGrid(List<Product> product) {
  return ResponsiveGridRow(
    children: product
        .map(
          (item) => ResponsiveGridCol(
            xs: 4,
            md: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 1, right: 1, bottom: 2),
              child: SweetDealsImageBox(
                image: NetworkImage(item.images[0]),
                productName: item.name,
              ),
            ),
          ),
        )
        .toList(),
  );
}
