import 'package:flutter/material.dart';
import '../constants/messaging_product_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

Widget messagingProductsGrid() {
  ResponsiveGridRow messageProductRow = ResponsiveGridRow(
    children: [
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "Mac Pro Max",
            productDescription: "Product Description 1",
            image: AssetImage('images/umbrella.jpg'),
            productName: 'Katana Umbrella',
            productLocation: 'Ondo',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            productDescription: "Product Description 2",
            image: AssetImage('images/cutleryimg.jpg'),
            productName: 'Cutlery',
            productLocation: 'Maiduguri',
            productType: 'Gift',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            price: "₦51,500",
            productDescription: "Product Description 3",
            image: AssetImage('images/television.jpg'),
            productName: 'LG Television',
            productLocation: 'Port-Hacourt',
            productType: 'Declutter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "iPhone 15 Max",
            productDescription: "Product Description 4",
            image: AssetImage('images/lens.jpg'),
            productName: 'Canon Camera Lens',
            productLocation: 'Lagos',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            productDescription: "Product Description 5",
            image: AssetImage('images/bikehelmet.jpg'),
            productName: 'Bike Helmet',
            productLocation: 'Lagos',
            productType: 'Gift',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "Pixa Pro",
            productDescription: "Product Description 6",
            image: AssetImage('images/couch.jpg'),
            productName: 'Living Room Couch',
            productLocation: 'Abia',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            productDescription: "Product Description 7",
            image: AssetImage('images/redshoes.jpg'),
            productName: 'Red Nike Shoes',
            productLocation: 'Jos',
            productType: 'Gift',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "Old Books",
            productDescription: "Product Description 8",
            image: AssetImage('images/flowervase.jpg'),
            productName: 'Flower Vase',
            productLocation: 'Lagos',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            price: "₦590,670,000",
            productDescription: "Product Description 9",
            image: AssetImage('images/bodyoil.jpg'),
            productName: 'Body Oil',
            productLocation: 'Kaduna',
            productType: 'Declutter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            price: "₦185,000",
            productDescription: "Product Description 10",
            image: AssetImage('images/blueperfumebottle.jpg'),
            productName: "'Blu de Parfum' Perfume",
            productLocation: 'Kebbi',
            productType: 'Declutter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            price: "₦320,000",
            productDescription: "Product Description 11",
            image: AssetImage('images/menswearcoll.jpg'),
            productName: 'Mens Wear Collection',
            productLocation: 'Enugu',
            productType: 'Declutter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "Hermes Bag",
            productDescription: "Product Description 12",
            image: AssetImage('images/deskaccessories.jpg'),
            productName: 'Desk Setup Accessories',
            productLocation: 'Imo',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            productDescription: "Product Description 13",
            image: AssetImage('images/pot.jpg'),
            productName: "Pink 'Non-Stick' Pot",
            productLocation: 'Lagos',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            expectedExchange: "Silverware Set",
            productDescription: "Product Description 14",
            image: AssetImage('images/silverwatch.jpg'),
            productName: 'Silver Mens Wristwatch',
            productLocation: 'Lagos',
            productType: 'Barter',
          ),
        ),
      ),
      ResponsiveGridCol(
        xs: 4,
        md: 2,
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          alignment: Alignment.center,
          child: const MessagingProductCard(
            productDescription: "Product Description 15",
            image: AssetImage('images/iphone11.jpg'),
            productName: 'Iphone 11',
            productLocation: 'Rivers',
            productType: 'Barter',
          ),
        ),
      ),
    ],
  );

  return messageProductRow;
}
