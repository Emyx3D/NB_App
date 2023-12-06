import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naijabatternew/utilities/models/user.dart';

import '../../../main.dart';

final userProvider = Provider<Future<User?>>((ref) async {
  String? user = prefs.getString('user');
  if (user == null) {
    return null;
  }

  final json = jsonDecode(user) as Map<String, dynamic>;
  return User.fromJson(json);
});


// Provider<Future<User>> userProvider(String username, String email) {
//   return Provider<Future<User>>((ref) async {
//     final response = await dio.get('/address/addAddress');

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
