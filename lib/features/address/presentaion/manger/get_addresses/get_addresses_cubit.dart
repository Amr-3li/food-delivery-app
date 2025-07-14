import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/data/repo/get_addresses/get_addresses_repo.dart';

import '../add_address/add_address_cubit.dart';



part 'get_addresses_state.dart';

class GetAddressesCubit extends Cubit<GetAddressesState> {
  GetAddressesCubit(this.getAddressesRepo) : super(GetAddressesInitial());

  final GetAddressesRepo getAddressesRepo;

  static GetAddressesCubit get(context) => BlocProvider.of(context);

  List<AddNewAddressModel>? addresses;

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

}
