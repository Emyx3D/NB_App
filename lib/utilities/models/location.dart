import 'package:naijabatternew/brain/constants.dart';

class Location {
  final String id;
  final String state;

  Location({
    required this.id,
    required this.state,
  });

  factory Location.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return Location(
      id: json['_id'] ?? '',
      state: json['state'] ?? notAvailable,
    );
  }
}
