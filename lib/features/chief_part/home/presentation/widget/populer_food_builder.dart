import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/populer_food_header.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/repository/food_list_repository_impl.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_cubit.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_state.dart';
import 'populer_food.dart';

class PopularFoodBuilder extends StatelessWidget {
  const PopularFoodBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodListCubit(FoodListRepositoryImpl(ApiHelper()))..fetchFoodItems(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopulerFoodHeader(),
              const SizedBox(height: 16),
              BlocBuilder<FoodListCubit, FoodListState>(
                builder: (context, state) {
                  if (state is FoodListLoading) {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is FoodListError) {
                    return SizedBox(
                      height: 150,
                      child: Center(child: Text(state.message)),
                    );
                  } else if (state is FoodListLoaded) {
                    final meals = state.foodItems;
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: meals.length,
                        itemBuilder: (context, index) {
                          final meal = meals[index];
                          return PopulerFood(meal: meal);
                        },
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 150,
                      child: Center(child: Text('No data available')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
