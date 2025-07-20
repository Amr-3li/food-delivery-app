import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_manger_state.dart';

class ImageMangerCubit extends Cubit<ImageMangerState> {
  ImageMangerCubit() : super(ImageMangerInitial());

  static ImageMangerCubit get(context) => BlocProvider.of(context);

  void pickImage({ImageSource source = ImageSource.gallery}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      emit(ImageManagerPickedState(image));
    }
  }
}
