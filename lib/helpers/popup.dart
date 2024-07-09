import 'package:flutter/material.dart';

void popUp(
  BuildContext context,
  Widget title,
  Widget content,
  List<Widget> actions,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: Colors.white,
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}
