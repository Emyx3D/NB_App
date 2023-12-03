import 'package:naijabatternew/brain/constants.dart';

class Category {
  final String id;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? notAvailable,
      description: json['description'] ?? notAvailable,
    );
  }
}
