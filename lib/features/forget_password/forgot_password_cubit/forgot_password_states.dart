abstract class ForgotPasswordStates{}
class InitialForgotPassword extends ForgotPasswordStates{}
class ForgotPasswordLoading extends ForgotPasswordStates{}
class ForgotPasswordSuccess extends ForgotPasswordStates{}
class ForgotPasswordSendOtpSuccess extends ForgotPasswordStates{}
class ForgotPasswordFailure extends ForgotPasswordStates{
 final String errorMessage ;

  ForgotPasswordFailure({required this.errorMessage});
}