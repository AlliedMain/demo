import 'dart:convert';
import 'dart:io';
import 'package:demo/config/app_config.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<Map<String, dynamic>> callGet(
      {Map<String, String>? headers, endPoint}) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse('${ApiUtils.baseUrl}$endPoint');
        debugPrint('url: $url');

        http.Response response = await http.get(url, headers: headers);

        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppStrings.checkConnection;
      }
    } else {
      throw AppStrings.checkConnection;
    }
  }

  static Future<Map<String, dynamic>> callPost(
    Map<String, String> body, {
    String? endPoint,
  }) async {
    bool isNet = await AppFunctions.checkInternet();
    if (isNet) {
      try {
        debugPrint(body.toString());
        Map<String, dynamic> finalresponse;
        Uri url = Uri.parse('${ApiUtils.baseUrl}$endPoint');
        debugPrint('url: $url');
        http.Response response = await http.post(url, body: body);

        finalresponse = checkResponse(response);
        return finalresponse;
      } on SocketException catch (_) {
        throw AppStrings.checkConnection;
      }
    } else {
      throw AppStrings.checkConnection;
    }
  }
}

Map<String, dynamic> checkResponse(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw AppStrings.errorMsg;
  }
}
