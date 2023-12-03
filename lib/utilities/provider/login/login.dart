import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/brain/constants.dart';
import 'package:naijabatternew/utilities/models/user.dart';

import '../../../main.dart';

Future<void> loginFunc(String email, String password) async {
  final dio = Dio();
  final response = await dio.post<Map<String, dynamic>>('$baseURL/login',
      data: {"email": email, "password": password});
  print(response.data.toString());

  await prefs.setString('user', response.data.toString());
}

final userProvider = Provider<Future<User?>>((ref) async {
  String? user = prefs.getString('user');
  if (user == null) {
    return null;
  }

  final json = jsonDecode(user) as Map<String, dynamic>;
  return User.fromJson(json);
});

User? userObj() {
  String? user = prefs.getString('user');
  if (user == null) {
    return null;
  }

  final json = jsonDecode(user) as Map<String, dynamic>;
  return User.fromJson(json);
}

// Provider<Future<User>> userProvider(String username, String email) {
//   return Provider<Future<User>>((ref) async {
//     final response = await dio.get('$baseURL/address/addAddress');

//     final json = jsonDecode(response.data.toString()) as Map<String, dynamic>;
//     return User.fromJson(json);
//   });
// }

// @riverpod
// String helloWorld(HelloWorldRef ref) {
//   return 'Hello world';
// }

// @riverpod
// User? user(UserRef ref) {
//   try {
//     String? user = prefs.getString('user');
//     if (user == null) {
//       return null;
//     }
//     final json = jsonDecode(user) as Map<String, dynamic>;
//     return User.fromJson(json);
//   } catch (e) {
//     return null;
//   }
// }
