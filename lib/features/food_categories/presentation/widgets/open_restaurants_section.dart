import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/home_user/data/repository/resturant_repository.dart';
import 'package:restaurant/features/home_user/presentation/cubit/resturant/resturant_cubit.dart';
import 'package:restaurant/features/home_user/presentation/cubit/resturant/resturant_state.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_restaurants_info.dart';
import 'package:sizer/sizer.dart';

class OpenRestaurantsSection extends StatelessWidget {
  const OpenRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantCubit(sl<RestaurantRepository>())..getRestaurants(),
      child: BlocBuilder<RestaurantCubit, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RestaurantLoaded) {
            return ListView.builder(
              itemCount: state.restaurants.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final restaurant = state.restaurants[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: CustomRestorantInfo(restaurant: restaurant),
                );
              },
            );
          } else if (state is RestaurantError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
