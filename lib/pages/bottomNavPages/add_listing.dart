import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtz_mobile/helpers/snackbar.dart';
import 'package:realtz_mobile/providers/add_product_provider.dart';
import 'package:realtz_mobile/widgets/addListing/choose_images.dart';
import 'package:realtz_mobile/widgets/addListing/products_details_form.dart';
import 'package:realtz_mobile/widgets/authWrapper/auth_wrapper.dart';

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

  void addingProductSuccess(String message) {
    if (!context.mounted) return;
    showSnackBar(
      context: context,
      message: message,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RedirectToLogin(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AddProductProvider>(
            create: (context) => AddProductProvider(),
          ),
        ],
        child: Scaffold(
          body: step == '1'
              ? ChooseImages(changeStep: changeStep)
              : ProductDetailsForm(
                  changeStep: changeStep,
                  addingProductSuccess: addingProductSuccess),
        ),
      ),
    );
  }
}
