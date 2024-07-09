import 'dart:convert';

import 'package:realtz_mobile/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

// authData contains user info, jwt token and an isLoggedIn variable
Future<void> authLogin(Map<String, dynamic> authData) async {
  final authPref = await SharedPreferences.getInstance();
  final authDataJson = jsonEncode(authData);
  authPref.setString(authInfoKey, authDataJson);
}

Future<Map<String, dynamic>> getAuthData() async {
  final authPref = await SharedPreferences.getInstance();
  final authInfoJson = authPref.getString(authInfoKey);
  if (authInfoJson == null) {
    return {};
  } else {
    final body = jsonDecode(authInfoJson);
    return body as Map<String, dynamic>;
  }
}

Future<void> authLogout() async {
  final authPref = await SharedPreferences.getInstance();
  authPref.remove(authInfoKey);
}
