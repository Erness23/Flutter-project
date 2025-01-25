import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String imagePath;

  const ProductTile({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      height: 300,
      width: double.maxFinite,
    );
  }
}
