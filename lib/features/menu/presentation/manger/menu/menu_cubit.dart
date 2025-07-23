import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/core/cache/cache_data.dart';
import 'package:restaurant/core/cache/cache_keys.dart';
import 'package:restaurant/core/cache/secure_cache_helper.dart';

import '../../../data/models/customer_profile_model.dart';
import '../../../data/repo/menu/menu_repo.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepo) : super(MenuInitial());

  final MenuRepo menuRepo;

  static MenuCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getCustomerProfile() {
    menuRepo.getCustomerProfile().then((result) {
      result.fold(
        (failure) {
          emit(GetCustomerProfileError(failure));
        },
        (userModel) {
          emit(GetCustomerProfileSuccess());
          this.userModel = userModel;
        },
      );
    });
  }

  void editCustomerProfile({
    required String? name,
    required String? email,
    required String? phone,
    required String? bio,
    required XFile? profileImage,
  }) {
    menuRepo
        .editCustomerProfile(
          profileImage: profileImage,
          name: name,
          email: email,
          phone: phone,
          bio: bio,
        )
        .then((result) {
          result.fold(
            (failure) {
              emit(EditCustomerProfileError(failure));
            },
            (successMessage) {
              emit(EditCustomerProfileSuccess(successMessage));
              if (name != null) {
                SecureCacheHelper.saveData(key: CacheKeys.userName, value: name);
              }
              getCustomerProfile();
            },
          );
        });
  }
}
