import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:restaurant/features/address/data/model/address_details_model.dart';

import '../../../../address/data/repo/add_address/add_address_repo.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit(this.addAddressRepo) : super(AddAddressInitial());

  final AddAddressRepo addAddressRepo;

  static AddAddressCubit get(context) => BlocProvider.of(context);

  Position? currentPosition;

  void getCurrentLocation() async {
    addAddressRepo
        .determinePosition()
        .then(
          (value) => value.fold(
            (failure) {
              emit(GetCurrentAddressError(failure));
            },
            (position) {
              currentPosition = position;
              emit(GetCurrentAddressSuccess());
            },
          ),
        )
        .catchError((error) {
          emit(GetCurrentAddressError(error.toString()));
        });
  }

  AddressDetailsModel? addressDetails;

  void getAddressDetails({
    required double latitude,
    required double longitude,
  }) async {
    final result = await addAddressRepo.getAddressDetails(
      latitude: latitude,
      longitude: longitude,
    );

    result.fold(
      (failure) {
        emit(GetAddressDetailsError(failure));
      },
      (addressDetails) {
        emit(GetAddressDetailsSuccess());
        this.addressDetails = addressDetails;
      },
    );
  }

  void addNewAddress({
    required String latitude,
    required String longitude,
    String? displayName,
    String? label,
    bool? isDefault,
  }) async {
    final result = await addAddressRepo.addNewAddress(
      latitude: latitude,
      longitude: longitude,
      displayName: displayName,
      label: label,
      isDefault: isDefault,
    );

    result.fold(
      (failure) {
        emit(AddNewAddressError(failure));
      },
      (message) {
        emit(AddNewAddressSuccess(message));
      },
    );
  }

  void updateAddress({
    required int addressId,
    required String latitude,
    required String longitude,
    String? displayName,
    String? label,
    bool? isDefault,
  }) async {
    final result = await addAddressRepo.updateAddress(
      addressId: addressId,
      latitude: latitude,
      longitude: longitude,
      displayName: displayName,
      label: label,
      isDefault: isDefault,
    );

    result.fold(
      (failure) {
        emit(EditAddressError(failure));
      },
      (message) {
        emit(EditAddressSuccess(message));
      },
    );
  }
}
