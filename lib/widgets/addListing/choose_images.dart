import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImages extends StatefulWidget {
  final void Function(String) changeStep;
  const ChooseImages({super.key, required this.changeStep});

  @override
  State<ChooseImages> createState() => _ChooseImagesState();
}

class _ChooseImagesState extends State<ChooseImages> {
  final ImagePicker _picker = ImagePicker();

  List<XFile>? _imageFileList = [];

  Future<void> _pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        if (selectedImages.length > 10) {
          _imageFileList = selectedImages.sublist(0, 10);
        } else {
          _imageFileList = selectedImages;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const Text('maximum of 10 images'),
          _imageFileList != null
              ? Wrap(
                  children: _imageFileList!.asMap().entries.map((image) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
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
                          Positioned(
                            bottom: -10,
                            right: -13,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _imageFileList!.removeAt(image.key);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
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
                widget.changeStep("2");
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
    );
  }
}
