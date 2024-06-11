import 'package:flutter/material.dart';
import 'package:realtz_mobile/pages/unprotectedPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class AddListing extends StatefulWidget {
  const AddListing({super.key});

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    final authData = await getAuthData();
    final bool isLoggedIn = authData['isLoggedIn'] ?? false;
    if (!isLoggedIn) {
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Login();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          'Add listing page',
        ),
      ),
    );
  }
}
