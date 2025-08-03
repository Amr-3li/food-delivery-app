import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/data/repo/get_addresses/get_addresses_repo.dart';

part 'get_addresses_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  GetAddressesCubit(this.getAddressesRepo) : super(GetAddressesInitial());

  final GetAddressesRepo getAddressesRepo;

  static GetAddressesCubit get(context) => BlocProvider.of(context);

  List<AddressesModel> addresses = [];

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

  AddressesModel? addressesModel;

  void getDefaultAddressDetails() async {
    final result = await getAddressesRepo.getDefaultAddress();

    result.fold(
      (failure) {
        emit(GetAddressesError(failure));
      },
      (addressDetails) {
        addressesModel = addressDetails;
        emit(GetAddressesSuccess());
      },
    );
  }

  void deleteAddress({required int addressId}) async {
    final result = await getAddressesRepo.deleteAddress(addressId: addressId);

    result.fold(
      (failure) {
        emit(DeleteAddressError(failure));
      },
      (message) {
        emit(DeleteAddressSuccess(message));
        getAddresses();
      },
    );
  }
}
