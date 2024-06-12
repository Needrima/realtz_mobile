import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realtz_mobile/pages/unprotectedPages/login.dart';
import 'package:realtz_mobile/sharedPrefs/auth_shared_pref.dart';

class AddListing extends StatefulWidget {
  const AddListing({super.key});

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  String step = '1';
  bool forRent = false;
  bool forShortlet = false;
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

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList = [];

  Future<void> _pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        if (selectedImages.length > 3) {
          _imageFileList = selectedImages.sublist(0, 3);
        } else {
          _imageFileList = selectedImages;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: step == '1'
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _pickImages();
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
                      child: const Text(
                        'Choose images',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                    _imageFileList != null
                        ? Wrap(
                            children:
                                _imageFileList!.asMap().entries.map((image) {
                              return Container(
                                margin: EdgeInsets.all(8.0),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        File(image.value.path),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _imageFileList!.removeAt(image.key);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        : const Text('No images selected'),
                    if (_imageFileList != null && _imageFileList!.isNotEmpty)
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            step = '2';
                          });
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
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : Scaffold(
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
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.title_rounded,
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
                          if (!RegExp(r'^[a-zA-Z0-9]{5,}$')
                              .hasMatch(value.toString())) {
                            return 'Title must be atleast 5 alphabetnumeric characters';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
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
                          if (!RegExp(r'^[a-zA-Z0-9]{20,800}$')
                              .hasMatch(value.toString())) {
                            return 'Description must be between 20 and 800 characters';
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText:
                              'Properties(comma seperated e.g: 5 bedrooms, \nswimming pool, parking lot, pets allowed)',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.abc_rounded,
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
                          print(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText:
                              'Hash tags(comma seperated e.g: #pets_allowed, \n#attic, #swimming pool)',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.abc_rounded,
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
                          print(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Location e.g: V.I, Lagos',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.abc_rounded,
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
                          print(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address e.g 14, John Doe Avenue',
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          prefixIcon: const Icon(
                            Icons.abc_rounded,
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
                          print(value);
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          print(value);
                        },
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Checkbox(
                                  value: forShortlet,
                                  onChanged: (value) {
                                    setState(() {
                                      forShortlet = value!;
                                    });
                                  },
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Checkbox(
                                  value: forRent,
                                  onChanged: (value) {
                                    setState(() {
                                      forRent = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (forShortlet)
                        SizedBox(
                          child: Column(children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Shortlet Fee (nightly)',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                prefixIcon: const Icon(
                                  Icons.money_rounded,
                                ),
                                prefixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(34, 34, 34, 0.05),
                              ),
                              validator: (value) {
                                print(value);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Caution fee',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                prefixIcon: const Icon(
                                  Icons.money_rounded,
                                ),
                                prefixIconColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(34, 34, 34, 0.05),
                              ),
                              validator: (value) {
                                print(value);
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {
                                print(value);
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ]),
                        ),
                      if (forRent)
                        SizedBox(
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Annual rent',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  prefixIcon: const Icon(
                                    Icons.money_rounded,
                                  ),
                                  prefixIconColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(34, 34, 34, 0.05),
                                ),
                                validator: (value) {
                                  print(value);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (value) {
                                  print(value);
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Agreement',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  prefixIcon: const Icon(
                                    Icons.money_rounded,
                                  ),
                                  prefixIconColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(34, 34, 34, 0.05),
                                ),
                                validator: (value) {
                                  print(value);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (value) {
                                  print(value);
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Commission',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  prefixIcon: const Icon(
                                    Icons.money_rounded,
                                  ),
                                  prefixIconColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(34, 34, 34, 0.05),
                                ),
                                validator: (value) {
                                  print(value);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (value) {
                                  print(value);
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Caution fee',
                                  hintStyle:
                                      Theme.of(context).textTheme.labelMedium,
                                  prefixIcon: const Icon(
                                    Icons.money_rounded,
                                  ),
                                  prefixIconColor: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(34, 34, 34, 0.05),
                                ),
                                validator: (value) {
                                  print(value);
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onSaved: (value) {
                                  print(value);
                                },
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
                              setState(() {
                                step = '1';
                              });
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
                            onPressed: () {
                              setState(() {
                                step = '3';
                              });
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
