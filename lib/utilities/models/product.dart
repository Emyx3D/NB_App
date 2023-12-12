import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/category.dart';
import 'package:naijabatternew/utilities/models/location.dart';

class Product {
  final String id;
  final double price;
  final double promotionPrice;
  final String name;
  final String productType;
  final String image;
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
    required this.image,
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
      image: json['image'] ?? '',
      exchange: json['exchange'] ?? notAvailable,
      promotionExpiresAtHm: json['promotionExpiresAt'] == null
          ? notAvailable
          : "${DateTime.parse(json['promotionExpiresAt']).hour}:${DateTime.parse(json['promotionExpiresAt']).minute}",
      category: Category.fromJson(json['category']),
      location: Location.fromJson(json['location']),
    );
  }
}
