import 'package:dartz/dartz.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';

abstract class GetAddressesRepo {
  Future<Either<String, List<AddressesModel>>> getAddresses();
  Future<Either<String, AddressesModel?>> getDefaultAddress();
}
