import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/category.dart';
import 'package:naijabatternew/utilities/models/location.dart';

class Product {
  final String id;
  final String price;
  final String name;
  final String productType;
  final String image;
  final String description;
  final Category category;
  final Location location;

  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.productType,
    required this.image,
    required this.description,
    required this.category,
    required this.location,
  });

  factory Product.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Product(
      id: json['_id'] ?? '',
      price: json['price'] ?? 0.0,
      name: json['name'] ?? notAvailable,
      productType: json['productType'] ?? 'barter',
      description: json['description'] ?? notAvailable,
      image: json['image'] ?? '',
      category: Category.fromJson(json['category']),
      location: Location.fromJson(json['location']),
    );
  }
}
