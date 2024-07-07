import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/providers/auth_provider.dart';

class RedirectToHome extends StatelessWidget {
  final Widget child;
  const RedirectToHome({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<AuthProvider>(context).isLoggedIn;

    if (loggedIn) {
      return const BottomNavPages();
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
