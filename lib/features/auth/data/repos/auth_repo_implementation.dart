import 'package:dartz/dartz.dart';
import 'package:restaurant/core/cache/cache_data.dart';
import 'package:restaurant/core/cache/cache_keys.dart';

import 'package:restaurant/core/cache/secure_cache_helper.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/auth/data/models/user_data/user_data.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AuthRepoImplementation extends AuthRepo {
  final ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<void, Failure>> forgetPassword({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.resetPassword,
        data: userModel.resetPasswordDataToJson(),
      );

      // final apiResponse = ApiResponse.fromResponse(response as Response);

      if (response.status) {
        return const Left(null);
      } else {
        return Right(Failure(errorMessage: response.message));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return Right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<UserData, Failure>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password},
      );

      // final apiResponse = ApiResponse.fromResponse(response as Response);

      if (response.status) {
        final userData = UserData.fromJson(response.data);
        final token = userData.data!.accessToken;
        final userName = userData.data!.user!.name!;
        if (token != null) {
          await SecureCacheHelper.saveData(key: CacheKeys.token, value: token);
          await SecureCacheHelper.saveData(key: CacheKeys.userName, value: userName);
          CacheData.accessToken = token;
          CacheData.userName = userName;
        }
        return Left(userData);
      } else {
        return Right(Failure(errorMessage: response.message));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return Right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<void, Failure>> userRegister({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: userModel.registerDataToJson(),
      );

      // final apiResponse = ApiResponse.fromResponse(response as Response);

      if (response.status) {
        return const Left(null);
      } else {
        return Right(Failure(errorMessage: response.message));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return Right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<void, Failure>> sendOtp({required String email}) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.sendOtp,
        data: {"email": email},
      );

      if (response.status) {
        return const Left(null);
      } else {
        return Right(Failure(errorMessage: response.message));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return Right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<void, Failure>> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.verifyEmail,
        data: {"email": email, "otp": otp},
      );

      // final apiResponse = ApiResponse.fromResponse(response as Response);

      if (response.status) {
        return const Left(null);
      } else {
        return Right(Failure(errorMessage: response.message));
      }
    } catch (error) {
      final apiResponse = ApiResponse.fromError(error);
      return Right(Failure(errorMessage: apiResponse.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.logout,
        isProtected: true, // Requires auth token
      );

      if (response.status) {
        return const Right(null); // Success
      } else {
        return Left(Failure(errorMessage: response.message));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
