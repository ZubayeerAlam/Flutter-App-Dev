import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_manager/Data/Model/Api_response.dart';
import 'package:task_manager/controller/auth_controller.dart';

class ApiCaller {
  static Future<ApiResponse> getRequest({required String url}) async {
    Response response = await get(
      Uri.parse(url),
      headers: {
        'token': AuthController.accessToken ?? '',
      }
    );
    print('URL=== $url');
    print('response === ${response.body}');


    // final decoded = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: true);
    } else {
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false, errorMessage: (response.body));    }
  }


  static Future<ApiResponse> postRequest({
    required String url,
    Map<dynamic, dynamic>? body,
  }) async {
    Response response = await post(
      Uri.parse(url),
      headers: {
        'token': AuthController.accessToken ?? '',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body != null ? jsonEncode(body) : null,
    );
    print('URL=== $url');
    print('response === ${response}');

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        isSuccess: true,
      );
    } else {
      return ApiResponse(
        responseCode: response.statusCode,
        responseData: jsonDecode(response.body),
        isSuccess: false,
        errorMessage: jsonDecode(response.body));
    }
  }
}