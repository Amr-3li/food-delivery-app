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
  Future<Either<String, AddressesModel>> getDefaultAddress() async {
    try {
      final apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.getDefaultAddress,
        isProtected: true,
      );

      if (apiResponse.data != null) {
        final address = AddressesModel.fromJson(apiResponse.data['address']);
        return Right(address);
      } else {
        return Left("No default address found.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> deleteAddress({required int addressId}) async {
    try {
      final apiResponse = await apiHelper.deleteRequest(
        endPoint: 'address/$addressId/destroy',
        isProtected: true,
      );

      if (apiResponse.status) {
        return Right('Address deleted successfully.');
      } else {
        return Left('Failed to delete address.');
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
