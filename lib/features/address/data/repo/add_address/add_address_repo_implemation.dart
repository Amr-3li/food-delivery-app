import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';

import 'package:restaurant/features/address/data/model/address_details_model.dart';

import '../../../../../core/network/api_response.dart';
import '../../model/address_model.dart';
import 'add_address_repo.dart';

class AddAddressRepoImplementation implements AddAddressRepo {
  AddAddressRepoImplementation._internal();
  static final AddAddressRepoImplementation _instance =
      AddAddressRepoImplementation._internal();

  factory AddAddressRepoImplementation() {
    return _instance;
  }

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, Position>> determinePosition() async {
    return right(await Geolocator.getCurrentPosition());
  }

  @override
  Future<Either<String, AddressDetailsModel>> getAddressDetails({
    required double latitude,
    required double longitude,
    int retries = 3,
  }) async {
    int attempt = 0;

    while (attempt < retries) {
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
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'User-Agent': 'YourAppName/1.0 (your@email.com)',
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
        attempt++;

        if (attempt >= retries) {
          ApiResponse errorResponse = ApiResponse.fromError(e);
          return Left(errorResponse.message);
        }

        await Future.delayed(const Duration(seconds: 2));
      }
    }

    return Left("Unknown error occurred.");
  }

  @override
  Future<Either<String, String>> addNewAddress({
    required String latitude,
    required String longitude,
    String? displayName,
    String? label,
    String? address,
    bool? isDefault,
  }) async {
    try {
      AddNewAddressModel addNewAddressModel = AddNewAddressModel(
        lat: latitude,
        lon: longitude,
        name: label,
        displayName: displayName,
        address: address,
        isDefault: isDefault,
      );

      debugPrint(latitude.toString());
      debugPrint(longitude.toString());
      debugPrint(addNewAddressModel.toJson().toString());

      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.address,
        data: addNewAddressModel.toJson(),
        isProtected: true,
      );

      if (apiResponse.data['status'] == true) {
        return Right('New address added successfully.');
      } else {
        return Left("Failed to add new address.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
