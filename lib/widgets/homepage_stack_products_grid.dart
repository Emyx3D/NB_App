import 'package:flutter/material.dart';
import 'package:naijabatternew/widgets/profile_page_imagebox.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget homepageStackProductsGrid() {
  return ResponsiveGridRow(
    children: [
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg1.png'),
            productName: 'Infinix Note',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg2.png'),
            productName: 'Accessories',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg3.png'),
            productName: 'Parlor Stool',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg4.png'),
            productName: 'High Heels',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg5.png'),
            productName: 'Puma Canvas',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/gridimg6.png'),
            productName: 'Wrist Watch',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/img2.png'),
            productName: 'Cutlery',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 11),
          child: const SweetDealsImageBox(
            image: AssetImage('images/television.jpg'),
            productName: 'Television',
          ),
        ),
      ),
    ],
  );
}
