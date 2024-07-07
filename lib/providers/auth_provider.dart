import 'package:flutter/material.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;

  AuthProvider() {
    checkIfLoggedIn();
  }

  void checkIfLoggedIn() async {
    final authData = await getAuthData();
    isLoggedIn = authData['isLoggedIn'] ?? false;
    notifyListeners();
  }
}
