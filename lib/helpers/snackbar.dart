import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message, Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor,
    ),
  );
}
