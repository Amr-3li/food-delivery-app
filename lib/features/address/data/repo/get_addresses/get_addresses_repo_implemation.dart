import 'package:dartz/dartz.dart';
import 'package:restaurant/core/utils/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';

import '../../../../../core/network/api_response.dart';
import '../../model/address_model.dart';
import 'get_addresses_repo.dart';

class GetAddressesRepoImplementation implements GetAddressesRepo {
  GetAddressesRepoImplementation._internal();
  static final GetAddressesRepoImplementation _instance =
      GetAddressesRepoImplementation._internal();

  factory GetAddressesRepoImplementation() {
    return _instance;
  }

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, List<AddressesModel>>> getAddresses() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.getAddress,
        isProtected: true,
      );

      if (apiResponse.data != null) {
        List<AddressesModel> addressesList = [];
        for (var item in apiResponse.data['data']['addresses']) {
          addressesList.add(AddressesModel.fromJson(item));
        }
        return Right(addressesList);
      } else {
        return Left("Failed to add new address.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, AddressesModel?>> getDefaultAddress() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: '${APIKey.baseApiUrl}/default/address',
        isProtected: true,
      );

      final data = apiResponse.data['data'];

      if (data != null && data['address'] != null) {
        final address = AddressesModel.fromJson(data['address']);
        return Right(address);
      } else {
        return Right(null); // No default address exists
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
