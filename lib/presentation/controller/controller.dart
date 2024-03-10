import 'dart:convert';

import 'package:apitask/data/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUserData {
  static String? accesstoken;
  static Future<void> saveData(userData, usersData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        'userData', jsonEncode(usersData.tojson()));
  }

  static Future<userData?> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? result = sharedPreferences.getString('userData');
    if (result == null) {
      return null;
    }
    return userData.fromJson(jsonDecode(result));
  }

  static Future<void> savetoken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    accesstoken= token;
  }

  static Future<String?> saveUsertoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  static Future<void> usercleardata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
