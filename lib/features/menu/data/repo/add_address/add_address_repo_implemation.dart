import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'package:restaurant/features/address/data/model/address_details_model.dart';
import 'package:restaurant/features/menu/data/repo/add_address/add_address_repo.dart';

import '../../../../../core/network/api_response.dart';

class AddAddressRepoImplementation implements AddAddressRepo {
  AddAddressRepoImplementation._internal();
  static final AddAddressRepoImplementation _instance =
      AddAddressRepoImplementation._internal();

  factory AddAddressRepoImplementation() {
    return _instance;
  }

  @override
  Future<Either<String, Position>> determinePosition() async {
    return right(await Geolocator.getCurrentPosition());
  }

  @override
  Future<Either<String, AddressDetailsModel>> getAddressDetails({
    required double latitude,
    required double longitude,
  }) async {
    try {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: 'https://nominatim.openstreetmap.org/',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          queryParameters: {
            'lat': latitude.toString(),
            'lon': longitude.toString(),
            'format': 'json',
          },
        ),
      );

      Response response = await dio.get('reverse');

      if (response.data != null) {
        AddressDetailsModel addressDetails = AddressDetailsModel.fromJson(
          response.data,
        );

        return Right(addressDetails);
      } else {
        return Left("Failed to fetch address details.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
