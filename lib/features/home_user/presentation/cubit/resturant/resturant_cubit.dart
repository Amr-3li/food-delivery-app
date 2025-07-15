import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home_user/data/repository/resturant_repository.dart';
import 'package:restaurant/features/home_user/presentation/cubit/resturant/resturant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository repository;

  RestaurantCubit(this.repository) : super(RestaurantInitial());

  Future<void> getRestaurants() async {
    emit(RestaurantLoading());
    try {
      final restaurants = await repository.fetchRestaurants();
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError("Failed to load restaurants"));
    }
  }
}
