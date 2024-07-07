import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  bool forRent = false;
  bool forShortlet = false;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];

  Future<void> pickImages() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      if (selectedImages.length > 10) {
        imageFileList = selectedImages.sublist(0, 10);
        notifyListeners();
      } else {
        imageFileList = selectedImages;
        notifyListeners();
      }
    }
  }

  void removeImage(int idx) {
    imageFileList!.removeAt(idx);
    notifyListeners();
  }

  void toggleListingOptions(String key, bool? value) {
    if (key == "rent") {
      forRent = value!;
    } else {
      forShortlet = value!;
    }
    notifyListeners();
  }
}
