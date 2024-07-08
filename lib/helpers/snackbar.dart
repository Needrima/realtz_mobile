import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: const Duration(seconds: 5),
    ),
  );
}
