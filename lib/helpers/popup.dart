import 'package:flutter/material.dart';

void popUp(
  BuildContext context,
  Widget title,
  Widget content,
  List<Widget> actions,
  bool barrierDismissible,
) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        surfaceTintColor: Colors.white,
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}
