import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/data/repo/get_addresses/get_addresses_repo.dart';

part 'get_addresses_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  GetAddressesCubit(this.getAddressesRepo) : super(GetAddressesInitial());

  final GetAddressesRepo getAddressesRepo;

  static GetAddressesCubit get(context) => BlocProvider.of(context);

  List<AddressesModel>? addresses;

  void getAddresses() async {
    final result = await getAddressesRepo.getAddresses();

    result.fold(
      (failure) {
        emit(GetAddressesError(failure));
      },
      (addresses) {
        emit(GetAddressesSuccess());
        this.addresses = addresses;
      },
    );
  }

  void getDefaultAddressDetails() async {
    final result = await getAddressesRepo.getDefaultAddress();

    result.fold(
      (failure) {
        emit(GetAddressesError(failure));
      },
      (addressDetails) {
        // 🟠 Handle null case from API
        if (addressDetails == null) {
          addresses = []; // Clear list
          emit(GetAddressesSuccess()); // Still emit success
        } else {
          addresses = [addressDetails]; // Wrap in list
          emit(GetAddressesSuccess());
        }
      },
    );
  }
}
