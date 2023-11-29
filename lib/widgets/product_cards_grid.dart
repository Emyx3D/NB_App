import 'package:flutter/material.dart';
import 'package:naijabatternew/widgets/product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget productsGrid() {
  return ResponsiveGridRow(
    children: [
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const ProductCard(
            image: AssetImage('images/chairimage.jpg'),
            productName: 'Mid-Century Modern Chair',
            productLocation: 'Lagos',
            productType: 'Television',
            eeisVisible: true,
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const ProductCard(
            image: AssetImage('images/chairimg.jpg'),
            productName: 'Mid-Century Modern Chair',
            productLocation: 'Lagos',
            productType: 'Gift',
            eeisVisible: false,
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const ProductCard(
            image: AssetImage('images/chairimg.jpg'),
            productName: 'Mid-Century Modern Chair',
            productLocation: 'Lagos',
            productType: 'Gift',
            eeisVisible: false,
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const ProductCard(
            image: AssetImage('images/chairimg.jpg'),
            productName: 'Mid-Century Modern Chair',
            productLocation: 'Lagos',
            productType: 'Gift',
            eeisVisible: false,
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const ProductCard(
            image: AssetImage('images/chairimage.jpg'),
            productName: 'Mid-Century Modern Chair',
            productLocation: 'Lagos',
            productType: 'Wristwatch',
            eeisVisible: true,
          ),
        ),
      ),
    ],
  );
}
