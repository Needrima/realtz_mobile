import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  Map<String, dynamic> user = {};
  bool isLoggedIn = false;
  String token = '';

  void login(Map<String, dynamic> userData) {
    user = userData['user'];
    token = userData['token'];
    isLoggedIn = true;
    notifyListeners();
  }
}
