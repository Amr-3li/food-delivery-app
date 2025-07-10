import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo{
 final ApiHelper apiHelper= ApiHelper();
 
  @override
  Future<Either<void, Failure>> forgetPassword({required UserModel userModel}) async{
  try {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.resetPassword,
      data:userModel.resetPasswordDataToJson(),
    );

    final apiResponse = ApiResponse.fromResponse(response as Response);

    if (apiResponse.status) {
      return const Left(null); 
    } else {
      return Right(Failure(errorMessage: apiResponse.message)); 
    }
  } catch (error) {
    final apiResponse = ApiResponse.fromError(error);
    return Right(Failure(errorMessage: apiResponse.message));
  }
}

  @override
  Future<Either<void, Failure>> userLogin({required UserModel userModel}) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
Future<Either<void, Failure>> userRegister({required UserModel userModel}) async {
  try {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.register,
      data: userModel.registerDataToJson(),
    );

    final apiResponse = ApiResponse.fromResponse(response as Response);

    if (apiResponse.status) {
      return const Left(null); 
    } else {
      return Right(Failure(errorMessage: apiResponse.message)); 
    }
  } catch (error) {
    final apiResponse = ApiResponse.fromError(error);
    return Right(Failure(errorMessage: apiResponse.message));
  }
}

  @override
  Future<Either<void, Failure>> sendOtp({required String email}) async{
    try {
    final response = await apiHelper.postRequest(
      endPoint: EndPoints.register,
      data: {"email":email},
    );

    final apiResponse = ApiResponse.fromResponse(response as Response);

    if (apiResponse.status) {
      return const Left(null); 
    } else {
      return Right(Failure(errorMessage: apiResponse.message)); 
    }
  } catch (error) {
    final apiResponse = ApiResponse.fromError(error);
    return Right(Failure(errorMessage: apiResponse.message));
  }
  }
}