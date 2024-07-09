import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realtz_mobile/constants/constants.dart';
import 'package:realtz_mobile/helpers/snackbar.dart';
import 'package:realtz_mobile/helpers/popup.dart';
import 'package:realtz_mobile/pages/bottomNavPages/bottom_nav_pages.dart';
import 'package:realtz_mobile/providers/add_product_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:realtz_mobile/providers/auth_provider.dart';
import 'package:realtz_mobile/widgets/loader/loader.dart';

class ProductDetailsForm extends StatefulWidget {
  final void Function(String) changeStep;
  final void Function(String)? addingProductSuccess;
  const ProductDetailsForm(
      {super.key, required this.changeStep, this.addingProductSuccess});

  @override
  State<ProductDetailsForm> createState() => _ProductDetailsFormState();
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
  bool addingListing = false;

  Future<void> addListing(
    List<XFile>? imageFileList,
    Map<String, dynamic> productDetails,
    String token,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$productServiceBaseURI/auth/create-image-product'),
    );
    request.headers['token'] = token;

    // Add JSON body
    request.fields['jsonBody'] = jsonEncode(productDetails);

    // Add images
    for (int i = 0; i < imageFileList!.length; i++) {
      var stream = http.ByteStream(imageFileList[i].openRead());
      var length = await imageFileList[i].length();

      var multipartFile = http.MultipartFile(
        'images', // this is the field name for the images array in your backend
        stream,
        length,
        filename: imageFileList[i].path.split('/').last,
      );

      request.files.add(multipartFile);
    }

    setState(() {
      addingListing = true;
    });

    try {
      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      final body = jsonDecode(response.body);

      // Handle the response
      if (response.statusCode == 200) {
        print("success");
        if (!context.mounted) return;
        Provider.of<AddProductProvider>(context, listen: false)
            .clearPoviderData();
        Navigator.of(context).pop();
        widget.changeStep("1");
        widget.addingProductSuccess!('${body['message']}');
      } else {
        print("non success");
        if (!context.mounted) return;
        showSnackBar(context: context, message: '${body['error']}');
        Navigator.of(context).pop();
      }

      setState(() {
        addingListing = false;
      });
    } catch (error) {
      print('error: $error');
      if (!context.mounted) return;
      showSnackBar(
        context: context,
        message: error.toString(),
      );

      setState(() {
        addingListing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final addProductVariablesProvider =
        Provider.of<AddProductProvider>(context);
    final addProductFunctionsProvider =
        Provider.of<AddProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Listing ',
            style: Theme.of(context).textTheme.titleLarge,
            children: <TextSpan>[
              TextSpan(
                text: 'details',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        child: Form(
          key: addProductVariablesProvider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                maxLines: null,
                controller: addProductVariablesProvider.titleInputController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.title_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                validator: (value) {
                  if (!RegExp(r'^[a-zA-Z0-9\s]{5,}$')
                      .hasMatch(value.toString())) {
                    return 'Title must be atleast 5 alphabetnumeric characters';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("title", value),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.abc_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                validator: (value) {
                  if (value.toString().length < 20 ||
                      value.toString().length > 500) {
                    return 'Description must be between 20 and 500 characters';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("description", value),
              ),
              Text(
                'Give a brief description of the property',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Properties',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.interests_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("properties", value),
              ),
              Text(
                'Properties should be comma seperated (e.g: 5 bedrooms, swimming pool, parking lot). Use short but descriptive properties as they help to boost your listing up the search algorithm',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Tags',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.tag_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("hash_tags", value),
              ),
              Text(
                'Tags should be comma seperated (e.g: pets_allowed, attic, swimming_pool). Use short but descriptive tags as they help to boost your listing up the search algorithm',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Location e.g: V.I, Lagos',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.location_on_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                validator: (value) {
                  if (value.toString().length < 5) {
                    return 'Location should be atleast 5 characters e.g: V.I, Lagos';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("location", value),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Address e.g 14, John Doe Avenue',
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  prefixIcon: const Icon(
                    Icons.location_city_rounded,
                  ),
                  prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                ),
                validator: (value) {
                  if (value.toString().length < 5) {
                    return 'Address should be atleast 5 characters e.g 14, John Doe Avenue';
                  } else {
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) => addProductFunctionsProvider
                    .setProductDetails("address", value),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          'For shortlet',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Checkbox(
                          value: addProductVariablesProvider
                              .productDetails["for_shortlet"] as bool,
                          onChanged: (value) => addProductFunctionsProvider
                              .toggleListingOptions("shortlet", value),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Text(
                          'For rent',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Checkbox(
                          value: addProductVariablesProvider
                              .productDetails["for_rent"] as bool,
                          onChanged: (value) => addProductFunctionsProvider
                              .toggleListingOptions("rent", value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if (addProductVariablesProvider.productDetails["for_shortlet"]
                  as bool)
                SizedBox(
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Shortlet Fee (nightly)',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                          return 'Shortlet fee must be numbers only';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) => addProductFunctionsProvider
                          .setProductDetails("short_let_amount", value),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Shortlet caution fee',
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: const Icon(
                          Icons.money_rounded,
                        ),
                        prefixIconColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                      ),
                      validator: (value) {
                        if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                          return 'Caution fee must be numbers only';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) => addProductFunctionsProvider
                          .setProductDetails("shortlet_caution_fee", value),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ]),
                ),
              if (addProductVariablesProvider.productDetails["for_rent"]
                  as bool)
                SizedBox(
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Annual rent',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.money_rounded,
                          ),
                          prefixIconColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                            return 'Rent must be numbers only';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => addProductFunctionsProvider
                            .setProductDetails("annual_rent", value),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Agreement',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.money_rounded,
                          ),
                          prefixIconColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                            return 'Agreement must be numbers only';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => addProductFunctionsProvider
                            .setProductDetails("agreement", value),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Commission',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.money_rounded,
                          ),
                          prefixIconColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                            return 'Commission must be numbers only';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => addProductFunctionsProvider
                            .setProductDetails("commission", value),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Rental caution fee',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.money_rounded,
                          ),
                          prefixIconColor:
                              Theme.of(context).colorScheme.inversePrimary,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color.fromRGBO(34, 34, 34, 0.05),
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                            return 'Rent caution fee must be numbers only';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => addProductFunctionsProvider
                            .setProductDetails("rent_caution_fee", value),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.changeStep("1");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (!addProductVariablesProvider.formKey.currentState!
                          .validate()) {
                        showSnackBar(
                            context: context,
                            message: 'invalid input somewhere');
                        return;
                      }
                      // add listing api
                      // await addListing(
                      //   addProductVariablesProvider.imageFileList,
                      //   addProductVariablesProvider.productDetails,
                      //   Provider.of<AuthProvider>(context, listen: false).token,
                      // );
                      popUp(
                        context,
                        Text(
                          'Proceed to add listing',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Ensure that all the information you entered are correct before proceeding as we do not allow editing of a listing once added.',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        [
                          GestureDetector(
                            onTap: addingListing
                                ? null
                                : () async {
                                    await addListing(
                                      addProductVariablesProvider.imageFileList,
                                      addProductVariablesProvider
                                          .productDetails,
                                      Provider.of<AuthProvider>(
                                        context,
                                        listen: false,
                                      ).token,
                                    );
                                  },
                            child: addingListing
                                ? const Loader(
                                    backgroundColor: Colors.black,
                                  )
                                : Text(
                                    'Yes, proceed',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontWeight: FontWeight.w700,
                                      // fontSize: 14,
                                    ),
                                  ),
                          ),
                          GestureDetector(
                            onTap: addingListing
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                  },
                            child: const Text(
                              'No, not yet',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                // fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      child: Text(
                        'Add Listing',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
