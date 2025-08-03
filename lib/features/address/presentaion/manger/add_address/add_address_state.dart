part of 'add_address_cubit.dart';

sealed class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

final class GetCurrentAddressSuccess extends AddAddressState {}

final class GetCurrentAddressError extends AddAddressState {
  final String error;

  GetCurrentAddressError(this.error);
}

final class GetAddressDetailsSuccess extends AddAddressState {}

final class GetAddressDetailsError extends AddAddressState {
  final String error;

  GetAddressDetailsError(this.error);
}

final class AddNewAddressSuccess extends AddAddressState {
  final String message;

  AddNewAddressSuccess(this.message);
}

final class AddNewAddressError extends AddAddressState {
  final String error;

  AddNewAddressError(this.error);
}

final class EditAddressSuccess extends AddAddressState {
  final String message;

  EditAddressSuccess(this.message);
}

final class EditAddressError extends AddAddressState {
  final String error;

  EditAddressError(this.error);
}
