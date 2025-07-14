import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant/features/address/data/model/address_details_model.dart';

abstract class AddAddressRepo {
  Future<Either<String, Position>> determinePosition();
  Future<Either<String, AddressDetailsModel>> getAddressDetails({
    required double latitude,
    required double longitude,
  });
  Future<Either<String, String>> addNewAddress({
    required double latitude,
    required double longitude,
    String? displayName,
    String? label,
    bool? isDefault,
  });
}
