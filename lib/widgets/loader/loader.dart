import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? backgroundColor;
  const Loader({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: backgroundColor,
    );
  }
}
