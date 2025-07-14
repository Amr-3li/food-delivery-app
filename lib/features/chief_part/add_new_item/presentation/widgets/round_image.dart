import 'dart:io';

import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final double width;
  final double height;
  final VoidCallback? onRemove;

  const RoundedImage({
    super.key,
    this.imageUrl,
    this.imageFile,
    this.width = 120,
    this.height = 110,
    this.onRemove,
  }) : assert(
         imageUrl != null || imageFile != null,
         'Either imageUrl or imageFile must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onRemove,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          imageFile!,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
