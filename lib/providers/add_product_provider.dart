import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  // variables
  bool forRent = false;
  bool forShortlet = false;
  List<XFile>? imageFileList = [];
  Map<String, dynamic> productDetails = {};

  // controllers
  final titleInputController = TextEditingController();
  final descInputController = TextEditingController();
  final propetiesInputController = TextEditingController();
  final hashtagsInputController = TextEditingController();
  final locationInputController = TextEditingController();
  final addrInputController = TextEditingController();
  final shortletFeeInputController = TextEditingController();
  final shortletCautionFeeInputController = TextEditingController();
  final rentInputController = TextEditingController();
  final agreementInputController = TextEditingController();
  final commisionInputController = TextEditingController();
  final rentCautionFeeInputController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
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

  void setProductDetails(String key, dynamic value) {
    switch (key) {
      case "title":
        titleInputController.text = value;
        break;
      case "descriptiom":
        descInputController.text = value;
        break;
      case "properties":
        propetiesInputController.text = value;
        break;
      case "hash_tags":
        hashtagsInputController.text = value;
        break;
      case "location":
        locationInputController.text = value;
        break;
      case "address":
        addrInputController.text = value;
        break;
      case "short_let_amount":
        shortletFeeInputController.text = value;
        break;
      case "shortlet_caution_fee":
        shortletCautionFeeInputController.text = value;
        break;
      case "annual_rent":
        rentInputController.text = value;
        break;
      case "agreement":
        agreementInputController.text = value;
        break;
      case "commission":
        commisionInputController.text = value;
        break;
      case "rent_caution_fee":
        rentCautionFeeInputController.text = value;
        break;
    }
    productDetails[key] = value;
    notifyListeners();
  }
}
