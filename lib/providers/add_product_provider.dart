import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  // variables
  bool forRent = false;
  bool forShortlet = false;
  List<XFile>? imageFileList = [];
  Map<String, dynamic> productDetails = {
    "for_rent": false,
    "for_shortlet": false,
  };
  final ImagePicker _picker = ImagePicker();

  // controllers
  final formKey = GlobalKey<FormState>();
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
      productDetails["for_rent"] = value!;
    } else {
      productDetails["for_shortlet"] = value!;
    }
    notifyListeners();
  }

  void setProductDetails(String key, dynamic value) {
    switch (key) {
      case "title":
        titleInputController.text = value;
        productDetails[key] = value;
        break;
      case "description":
        descInputController.text = value;
        productDetails[key] = value;
        break;
      case "properties":
        propetiesInputController.text = value;
        productDetails[key] = value
            .toString()
            .split(',')
            .map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .toList();
        break;
      case "hash_tags":
        hashtagsInputController.text = value;
        productDetails[key] = value
            .toString()
            .split(',')
            .map((item) => item.trim())
            .where((item) => item.isNotEmpty)
            .toList();
        break;
      case "location":
        locationInputController.text = value;
        productDetails[key] = value;
        break;
      case "address":
        addrInputController.text = value;
        productDetails[key] = value;
        break;
      case "short_let_amount":
        shortletFeeInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
      case "shortlet_caution_fee":
        shortletCautionFeeInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
      case "annual_rent":
        rentInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
      case "agreement":
        agreementInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
      case "commission":
        commisionInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
      case "rent_caution_fee":
        rentCautionFeeInputController.text = value;
        productDetails[key] = double.parse(value);
        break;
    }
    notifyListeners();
  }

  void clearPoviderData() {
    forRent = false;
    forShortlet = false;
    imageFileList = [];
    productDetails = {
      "for_rent": false,
      "for_shortlet": false,
    };

    // controllers
    titleInputController.clear();
    descInputController.clear();
    propetiesInputController.clear();
    hashtagsInputController.clear();
    locationInputController.clear();
    addrInputController.clear();
    shortletFeeInputController.clear();
    shortletCautionFeeInputController.clear();
    rentInputController.clear();
    agreementInputController.clear();
    commisionInputController.clear();
    rentCautionFeeInputController.clear();

    notifyListeners();
  }
}
