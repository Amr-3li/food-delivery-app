import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/build_upload_button.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/round_image.dart';

class FoodImageBuilder extends StatelessWidget {
  final List<ItemImage> images;
  final VoidCallback onAddImage;
  final ValueChanged<String>? onRemoveImage;
  final double imageSize;

  const FoodImageBuilder({
    super.key,
    required this.images,
    required this.onAddImage,
    this.onRemoveImage,
    this.imageSize = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: images.length + 1,
        itemBuilder: (context, index) {
          if (index == images.length) {
            return BuildUploadButton(onPressed: onAddImage);
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: RoundedImage(
              imageFile: File(images[index].file.path),
              width: imageSize,
              onRemove: onRemoveImage != null
                  ? () => onRemoveImage!(images[index].id)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
