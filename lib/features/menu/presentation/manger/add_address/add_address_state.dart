part of 'add_address_cubit.dart';

@immutable
sealed class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

final class AddAddressSuccess extends AddAddressState {}

final class AddAddressError extends AddAddressState {
  final String error;

  AddAddressError(this.error);
}

final class GetAddressDetailsSuccess extends AddAddressState {}

final class GetAddressDetailsError extends AddAddressState {
  final String error;

  GetAddressDetailsError(this.error);
}
