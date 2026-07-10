import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Data/Model/User_model.dart';

class AuthController {
  static String? accessToken;
  static userModel? userData;

  static Future saveUserData(userModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));
    accessToken = token;
    userData = model;
    print('TOKEN SAVED=== ${AuthController.accessToken}');
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token != null) {
      accessToken = token;
    }
    print('TOKEN LOADED=== ${AuthController.accessToken}');

    String? user = sharedPreferences.getString('user-data');

    if (user != null && user.isNotEmpty) {
      userData = userModel.fromJson(jsonDecode(user));
    }
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    return token != null;
  }
}