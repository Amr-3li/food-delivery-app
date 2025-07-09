import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';

sealed class ItemImagesState {}

final class ItemImagesInitial extends ItemImagesState {}

final class ItemImagesUpdated extends ItemImagesState {
  final List<ItemImage> images;

  ItemImagesUpdated(this.images);
}

final class ItemImagesError extends ItemImagesState {
  final String message;

  ItemImagesError(this.message);
}
