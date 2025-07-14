import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
Future<Either<void , Failure>>userRegister({required UserModel userModel});
Future<Either<void , Failure>>userLogin({required UserModel userModel});
Future<Either<void , Failure>>forgetPassword({required UserModel userModel});
Future<Either<void , Failure>>sendOtp({required String email});

}