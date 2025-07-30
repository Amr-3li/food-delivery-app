import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/models/restaurant_details_model.dart';
import 'package:restaurant/features/home/data/models/restaurants_model.dart';
import 'package:restaurant/features/home/presentation/cubit/resturant/resturant_state.dart';

import '../../../data/repository/resturant_repository.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository repository;

  RestaurantCubit(this.repository) : super(RestaurantInitial());

  static RestaurantCubit get(context) => BlocProvider.of(context);

  RestaurantsModel? restaurantsModel;

  Future<void> getRestaurants() async {
    final result = await repository.fetchRestaurants().then((value) {
      value.fold((error) => emit(GetRestaurantsError(error)), (restaurants) {
        restaurantsModel = restaurants;
        emit(GetRestaurantsSuccess());
      });
    });
  }

  RestaurantDetailsModel? restaurantDetailsModel;

  Future<void> getRestaurantDetails({required int id}) async {
    final result = await repository.getRestaurantDetails(id: id).then((value) {
      value.fold((error) => emit(GetRestaurantsError(error)), (restaurant) {
        restaurantDetailsModel = restaurant;
        emit(GetRestaurantsSuccess());
      });
    });
  }

  List<Meal> meals = [];

  void selectCategory({required String category}) async {
    if (restaurantDetailsModel != null && category.isNotEmpty) {
      restaurantDetailsModel!.data!.menu!.categories.forEach((element) {
        if (element.category!.name == category) {
          meals = element.meals;
          emit(SelectCategorySuccess());
        }
      });
    }
  }
}
