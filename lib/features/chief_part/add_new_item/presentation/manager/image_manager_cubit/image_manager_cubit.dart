import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/image_manager_cubit/image_manager_state.dart';

class ItemImagesCubit extends Cubit<ItemImagesState> {
  ItemImagesCubit() : super(ItemImagesInitial());

  final List<ItemImage> _images = [];

  void addImage(ItemImage image) {
    _images.add(image);
    emit(ItemImagesUpdated(List.from(_images)));
  }

  void removeImage(String imageId) {
    _images.removeWhere((image) => image.id == imageId);
    emit(
      _images.isEmpty
          ? ItemImagesInitial()
          : ItemImagesUpdated(List.from(_images)),
    );
  }
}
