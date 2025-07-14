part of 'get_addresses_cubit.dart';

@immutable
sealed class GetAddressesState {}

final class GetAddressesInitial extends GetAddressesState {}

final class GetAddressesSuccess extends GetAddressesState {}

final class GetAddressesError extends GetAddressesState {
  final String error;

  GetAddressesError(this.error);
}
