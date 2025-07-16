import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/data/repo/menu/menu_repo.dart';
import '../../../../../core/network/api_helper.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../../core/network/end_points.dart';
import '../../models/customer_profile_model.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepoImplementation implements MenuRepo {
  MenuRepoImplementation._internal();
  static final MenuRepoImplementation _instance =
      MenuRepoImplementation._internal();
  factory MenuRepoImplementation() {
    return _instance;
  }

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, UserModel>> getCustomerProfile() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.profile,
        isProtected: true,
      );

      if (apiResponse.data != null) {
        UserModel userModel = UserModel.fromJson(
          apiResponse.data['data']['user'],
        );
        return Right(userModel);
      } else {
        return Left("Failed to fetch customer profile.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> editCustomerProfile({
    required XFile? profileImage,
    required String? name,
    required String? email,
    required String? phone,
    required String? bio,
  }) async {
    try {
      UserModel userModel = UserModel(
        profileImage: profileImage,
        name: name,
        email: email,
        phone: phone,
        bio: bio,
      );
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.profile,
        isProtected: true,
        isFormData: true,
        data: userModel.toJson(),
      );

      debugPrint(
        'apiResponse---------------------------------------????${apiResponse.data}',
      );

      if (apiResponse.data != null) {
        return Right(apiResponse.data['message']);
      } else {
        return Left("Failed to edit customer profile.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
