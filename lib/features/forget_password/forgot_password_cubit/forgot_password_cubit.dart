import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo.dart';
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates>{
  ForgotPasswordCubit(this.authRepo):super(InitialForgotPassword());
 final  AuthRepo authRepo ;
 Future <void>sendOtp ({required String email} )async{
emit(ForgotPasswordLoading());
var response =await authRepo.sendOtp(email: email);
response.fold((right)=>emit(ForgotPasswordSendOtpSuccess()), (left)=>emit(ForgotPasswordFailure(errorMessage: left.errorMessage)));
 }
 Future <void> resetPassword ({required UserModel userModel})async{
  var result = await authRepo.forgetPassword(userModel: userModel);
  result.fold((right)=>emit(ForgotPasswordSuccess()), (left)=>emit(ForgotPasswordFailure(errorMessage: left.errorMessage)));
 }
}