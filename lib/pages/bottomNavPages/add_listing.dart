import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/pages/onboardingPages/login.dart';
import 'package:realtz_mobile/providers/add_product_provider.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';
import 'package:realtz_mobile/widgets/addListing/choose_images.dart';
import 'package:realtz_mobile/widgets/addListing/products_details_form.dart';

class AddListing extends StatefulWidget {
  const AddListing({super.key});

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  String step = '1';
  bool forRent = false;
  bool forShortlet = false;
  void changeStep(String s) {
    setState(() {
      step = s;
    });
  }

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddProductProvider>(
          create: (context) => AddProductProvider(),
        ),
      ],
      child: Scaffold(
        body: step == '1'
            ? ChooseImages(changeStep: changeStep)
            : ProductDetailsForm(changeStep: changeStep),
      ),
    );
  }
}
