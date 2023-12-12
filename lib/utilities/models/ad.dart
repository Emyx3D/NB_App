import 'package:naijabatternew/brain/constants.dart';

class Ad {
  final String id;
  final String name;
  final String image;

  Ad({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ad.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Ad(
      id: json['_id'] ?? '',
      name: json['name'] ?? notAvailable,
      image: json['image'] ?? '',
    );
  }
}
