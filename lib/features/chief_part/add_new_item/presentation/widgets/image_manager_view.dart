import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/image_manager_cubit/image_manager_cubit.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/image_manager_cubit/image_manager_state.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/build_upload_button.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/image_builder.dart';

class ImageManagerView extends StatelessWidget {
  final void Function(ItemImage image) onImageAdded;
  final void Function(String imageId)? onImageRemoved;

  const ImageManagerView({
    super.key,
    required this.onImageAdded,
    this.onImageRemoved,
  });

  Future<void> _pickImage(BuildContext context) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        if (context.mounted) {
          context.read<ItemImagesCubit>().addImage(
            ItemImage(id: ItemImage.generateId(), file: pickedFile),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
        );
      }
      debugPrint('Image picker error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemImagesCubit(),
      child: BlocBuilder<ItemImagesCubit, ItemImagesState>(
        builder: (context, state) {
          if (state is ItemImagesInitial) {
            return BuildUploadButton(onPressed: () => _pickImage(context));
          } else if (state is ItemImagesUpdated) {
            if (state.images.isEmpty) {
              return BuildUploadButton(onPressed: () => _pickImage(context));
            }
            return FoodImageBuilder(
              images: state.images,
              onAddImage: () => _pickImage(context),
              onRemoveImage: onImageRemoved,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
