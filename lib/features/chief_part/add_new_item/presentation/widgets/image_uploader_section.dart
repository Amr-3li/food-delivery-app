// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/image_manager_cubit/image_manager_cubit.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/image_manager_cubit/image_manager_state.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/build_upload_button.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/image_builder.dart';

class ImageUploadSection extends StatelessWidget {
  final ValueChanged<List<ItemImage>>? onImagesChanged;
  @override
  final Key? key;

  const ImageUploadSection({this.key, this.onImagesChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ItemImagesCubit(),
      child: _ImageUploadContent(
        onImagesChanged: onImagesChanged,
        key: key, // Pass the key down
      ),
    );
  }
}

class _ImageUploadContent extends StatelessWidget {
  final ValueChanged<List<ItemImage>>? onImagesChanged;
  // ignore: annotate_overrides
  final Key? key;

  const _ImageUploadContent({this.key, this.onImagesChanged}) : super(key: key);

  Future<void> _pickImage(BuildContext context) async {
    try {
      final currentState = context.read<ItemImagesCubit>().state;
      if (currentState is ItemImagesUpdated && currentState.images.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "You can upload one image only",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }

      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedFile == null) return;

      if (context.mounted) {
        final cubit = context.read<ItemImagesCubit>();
        final newImage = ItemImage(
          id: ItemImage.generateId(),
          file: pickedFile,
        );
        cubit.addImage(newImage);
        onImagesChanged?.call((cubit.state as ItemImagesUpdated).images);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('UPLOAD PHOTO', style: Styles.textStyle16),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: BlocBuilder<ItemImagesCubit, ItemImagesState>(
            builder: (context, state) {
              if (state is ItemImagesInitial) {
                return BuildUploadButton(onPressed: () => _pickImage(context));
              } else if (state is ItemImagesUpdated) {
                return FoodImageBuilder(
                  images: state.images,
                  onAddImage: () => _pickImage(context),
                  onRemoveImage: (id) {
                    context.read<ItemImagesCubit>().removeImage(id);
                    onImagesChanged?.call(state.images);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
