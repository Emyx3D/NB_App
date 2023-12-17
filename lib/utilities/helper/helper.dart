import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:naijabatternew/utilities/helper/dio.dart';
import 'package:naijabatternew/utilities/helper/snackbar.dart';
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

Future<bool> sendDataWithImage(
    url, Map<String, dynamic> data, List<XFile?>? files,
    {String imageName = 'image',
    bool justFirst = false,
    String method = 'POST',
    successMsg = 'Successful',
    errorAltMsg = 'Failed'}) async {
  try {
    if (files != null) {
      List<MultipartFile> multipartFiles = [];
      for (XFile? file in files) {
        if (file != null) {
          multipartFiles.add(
            await MultipartFile.fromFile(
              file.path,
              filename: file.name,
            ),
          );
        }
      }
      if (justFirst) {
        data[imageName] = multipartFiles.firstOrNull;
      } else {
        data[imageName] = multipartFiles;
      }
    }

    print('data: $data');

    FormData formData = FormData.fromMap(data);

    Response response;

    switch (method.toUpperCase()) {
      case "POST":
        response = await dio.post(url,
            data: formData, options: Options(headers: headerFunc()));
        break;
      case "PATCH":
        response = await dio.patch(url,
            data: formData, options: Options(headers: headerFunc()));
        break;
      case "PUT":
        response = await dio.put(url);
        break;
      default:
        response = await dio.post(url,
            data: formData, options: Options(headers: headerFunc()));
    }

    print('Response: ${response.data}');

    if (response.statusCode.toString().startsWith('2')) {
      successSnackbar(successMsg);
    } else {
      failedSnackbar(response.data['error'] ?? errorAltMsg);
    }
    return response.statusCode.toString().startsWith('2');
  } catch (error) {
    print('Error: $error');
    return false;
  }
}
