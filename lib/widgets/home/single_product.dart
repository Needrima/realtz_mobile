import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String productTitle;
  const SingleProduct({super.key, required this.productTitle});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.productTitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
