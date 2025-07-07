import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_access_state.dart';

class LocationAccessCubit extends Cubit<LocationAccessState> {
  LocationAccessCubit() : super(LocationAccessInitial());

  static LocationAccessCubit get(context) => BlocProvider.of(context);

  Future<void> requestLocationAccessPermission() async {

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        emit(LocationAccessError('Location services are disabled. Please enable them.'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        emit(LocationAccessError('Permission permanently denied. Please enable it manually.'));
        await Geolocator.openAppSettings();
        return;
      }

      if (permission == LocationPermission.denied) {
        emit(LocationAccessError('Location permission denied.'));
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      emit(LocationAccessSuccess());
    } catch (e) {
      emit(LocationAccessError('An error occurred while accessing location: $e'));
    }
  }

}
