part of 'image_manger_cubit.dart';

sealed class ImageMangerState {}

final class ImageMangerInitial extends ImageMangerState {}

final class ImageManagerInitial extends ImageMangerState {}

final class ImageManagerPickedState extends ImageMangerState {
  final XFile image;

  ImageManagerPickedState(this.image);
}
