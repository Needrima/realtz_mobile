import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/providers/auth_provider.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class RedirectToHome extends StatefulWidget {
  final Widget child;
  const RedirectToHome({super.key, required this.child});

  @override
  State<RedirectToHome> createState() => _RedirectToHomeState();
}

class _RedirectToHomeState extends State<RedirectToHome> {
  bool loggedIn = false;

  void setLoggedIn() async {
    bool isLoggedIn = await checkIfLoggedIn();
    setState(() {
      loggedIn = isLoggedIn;
    });
  }

  @override
  void initState() {
    super.initState();
    setLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    if (loggedIn) {
      return const BottomNavPages();
    }
    return widget.child;
  }
}

class RedirectToLogin extends StatefulWidget {
  final Widget child;
  const RedirectToLogin({super.key, required this.child});

  @override
  State<RedirectToLogin> createState() => _RedirectToLoginState();
}

class _RedirectToLoginState extends State<RedirectToLogin> {
  bool loggedIn = false;

  void setLoggedIn() async {
    bool isLoggedIn = await checkIfLoggedIn();
    setState(() {
      loggedIn = isLoggedIn;
    });
  }

  @override
  void initState() {
    super.initState();
    setLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    if (!loggedIn) {
      return const Login();
    }
    return widget.child;
  }
}
