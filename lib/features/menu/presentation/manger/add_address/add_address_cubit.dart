import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:restaurant/features/menu/data/models/address_details_model.dart';
import 'package:restaurant/features/menu/data/repo/add_address/add_address_repo.dart';

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
              emit(AddAddressError(failure));
            },
            (position) {
              currentPosition = position;
              emit(AddAddressSuccess());
            },
          ),
        )
        .catchError((error) {
          emit(AddAddressError(error.toString()));
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
}
