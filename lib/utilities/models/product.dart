import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/category.dart';
import 'package:naijabatternew/utilities/models/location.dart';

class Product {
  final String id;
  final double price;
  final double promotionPrice;
  final String name;
  final String productType;
  final List images;
  final String exchange;
  final String description;
  final Category category;
  final Location location;
  final String promotionExpiresAtHm;

  Product({
    required this.id,
    required this.price,
    required this.promotionPrice,
    required this.name,
    required this.productType,
    required this.images,
    required this.description,
    required this.category,
    required this.exchange,
    required this.location,
    required this.promotionExpiresAtHm,
  });

  factory Product.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Product(
      id: json['_id'] ?? '',
      price:
          json['price'] == null ? 0.0 : double.parse(json['price'].toString()),
      promotionPrice: json['promotionPrice'] == null
          ? json['price'] == null
              ? 0.0
              : double.parse(json['price'].toString())
          : double.parse(json['promotionPrice'].toString()),
      name: json['name'] ?? notAvailable,
      productType: json['product_type'] ?? 'barter',
      description: json['description'] ?? notAvailable,
      images: json['images'] == null || json['images'].isEmpty
          ? [
              'https://res.cloudinary.com/dwlrmjmai/image/upload/v1702455145/agp5ciu0ldb0qvrtdpd9.jpg'
            ]
          : json['images'],
      exchange: json['exchange'] ?? notAvailable,
      promotionExpiresAtHm: json['promotionExpiresAt'] == null
          ? notAvailable
          : "${DateTime.parse(json['promotionExpiresAt']).hour}:${DateTime.parse(json['promotionExpiresAt']).minute}",
      category: Category.fromJson(json['category']),
      location: Location.fromJson(json['location']),
    );
  }

  int get theProductType {
    if (productType == 'declutter') {
      return 3;
    }
    if (productType == 'barter') {
      return 2;
    }
    return 1;
  }

  String theTrade({bool inPromo = false}) {
    if (theProductType == 3) {
      if (inPromo) {
        return '₦$promotionPrice';
      }
      return '₦$price';
    }
    if (theProductType == 2) {
      return exchange;
    }
    return 'free';
  }

  String theTradeNarrative() {
    if (theProductType == 3) {
      return 'Price';
    }
    if (theProductType == 2) {
      return 'Expected Exchange';
    }
    return 'Gift';
  }
}
