part of 'menu_cubit.dart';

sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class GetCustomerProfileSuccess extends MenuState {}

final class GetCustomerProfileError extends MenuState {
  final String errorMessage;

  GetCustomerProfileError(this.errorMessage);
}

final class EditCustomerProfileSuccess extends MenuState {
  final String successMessage;

  EditCustomerProfileSuccess(this.successMessage);
}

final class EditCustomerProfileError extends MenuState {
  final String errorMessage;

  EditCustomerProfileError(this.errorMessage);
}
