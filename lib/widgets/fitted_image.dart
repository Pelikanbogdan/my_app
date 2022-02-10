import 'package:flutter/material.dart';

class FittedImage extends StatelessWidget {
  const FittedImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: image
    );
  }
}