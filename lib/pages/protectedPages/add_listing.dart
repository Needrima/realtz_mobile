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
  XFile? _singleFile;

  Future<void> _pickImages({bool isCamera = false}) async {
    if (isCamera) {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      setState(() {
        _singleFile = file;
      });
    } else {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
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
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text('or'),
            TextButton(
              onPressed: () {
                _pickImages(isCamera: true);
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
                'Capture images',
                style: TextStyle(color: Colors.white),
              ),
            ),
            _imageFileList != null
                ? Wrap(
                    children: _imageFileList!.asMap().entries.map((image) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Image.file(
                              File(image.value.path),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
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
                : _singleFile != null
                    ? Container(
                        margin: EdgeInsets.all(8.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Image.file(
                              File(_singleFile!.path),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _singleFile = null;
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const Text('No images selected'),
          ],
        ),
      ),
    );
  }
}
