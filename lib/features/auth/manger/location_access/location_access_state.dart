part of 'location_access_cubit.dart';

@immutable
sealed class LocationAccessState {}

final class LocationAccessInitial extends LocationAccessState {}

final class LocationAccessSuccess extends LocationAccessState {}

final class LocationAccessError extends LocationAccessState {
  final String error;

  LocationAccessError(this.error);
}