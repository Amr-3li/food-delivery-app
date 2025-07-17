import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/home_user/presentation/cubit/resturant/resturant_cubit.dart';
import 'package:restaurant/features/home_user/presentation/cubit/resturant/resturant_state.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_restaurants_info.dart';

class AllRestaurantsScreen extends StatelessWidget {
  const AllRestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Restaurants')),
      body: BlocProvider(
        create: (context) => sl<RestaurantCubit>()..getRestaurants(),
        child: BlocBuilder<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RestaurantLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = state.restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomRestorantInfo(restaurant: restaurant),
                  );
                },
              );
            } else if (state is RestaurantError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
