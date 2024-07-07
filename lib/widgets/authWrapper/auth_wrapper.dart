import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/bottomNavPages/home.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/providers/auth_provider.dart';

class RedirectToHpme extends StatelessWidget {
  final Widget child;
  const RedirectToHpme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<AuthProvider>(context).isLoggedIn;

    if (loggedIn) {
      return const Home();
    }
    return child;
  }
}

class RedirectToLogin extends StatelessWidget {
  final Widget child;
  const RedirectToLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<AuthProvider>(context).isLoggedIn;

    if (!loggedIn) {
      return const Login();
    }
    return child;
  }
}
