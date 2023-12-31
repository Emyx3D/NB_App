import 'package:intl/intl.dart';
import 'package:naijabatternew/brain/constants.dart';

class User {
  final String id;
  final String email;
  final String phone;
  final String name;
  final String username;
  final String image;
  final String token;
  final String location;
  final bool isBusiness;
  final bool isBusinessApproved;
  final String dob;

  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.username,
    required this.image,
    required this.token,
    required this.location,
    required this.isBusiness,
    required this.isBusinessApproved,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return User(
      id: json['_id'] ?? '',
      email: json['email'] ?? notAvailable,
      phone: json['phone'] ?? notAvailable,
      name: json['name'] ?? notAvailable,
      username: json['username'] ?? notAvailable,
      isBusiness: json['is_business'] ?? false,
      isBusinessApproved: json['is_business_approved'] ?? false,
      image: json['image'] ?? '',
      token: json['token'] ?? '',
      location: json['location'] ?? notAvailable,
      dob: json['dob'] != null
          ? DateFormat('yyyy-MM-dd').format(DateTime.parse(json['dob']))
          : '',
    );
  }
}
