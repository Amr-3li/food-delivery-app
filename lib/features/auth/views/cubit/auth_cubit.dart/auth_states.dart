import 'package:restaurant/features/auth/data/models/user_data/user_data.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserData userData;

  LoginSuccess(this.userData);
}

class RegisterSuccess extends AuthState {}

class VerifyEmailSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class LogoutSuccess extends AuthState {}

class LogoutError extends AuthState {
  final String message;

  LogoutError(this.message);
}
