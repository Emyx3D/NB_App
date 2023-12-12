import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/models/user.dart';
import 'package:naijabatternew/utilities/provider/auth/auth.dart';

String formattedPrice(double value) {
  final numberFormat = NumberFormat('#,##0.00');
  return numberFormat.format(value);
}

Map<String, dynamic> headerFunc() {
  User? user = getUser();
  String authToken = user?.token ?? '';

  Map<String, dynamic> res = {
    'Authorization': 'Bearer $authToken',
  };
  return res;
}

Future<bool> sendDataWithImage(Map<String, dynamic> data, XFile? file) async {
  try {
    if (file != null) {
      data['image'] = await MultipartFile.fromFile(
        file.path,
        filename: file.name,
      );
    }
    print('data: $data');

    FormData formData = FormData.fromMap(data);

    Response response = await dio.post('/product',
        data: formData, options: Options(headers: headerFunc()));

    print('Response: ${response.data}');
    return response.statusCode.toString().startsWith('2');
  } catch (error) {
    print('Error: $error');
    return false;
  }
}
