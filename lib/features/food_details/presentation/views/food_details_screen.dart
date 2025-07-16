import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/food_details/data/food_details_repository.dart';
import 'package:restaurant/features/food_details/presentation/cubit/food_details_cubit.dart';
import 'package:restaurant/features/food_details/presentation/cubit/food_details_state.dart';
import 'package:restaurant/features/food_details/presentation/widgets/quantity_selector.dart';
import 'package:restaurant/features/food_details/presentation/widgets/size_selector.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodDetailsCubit(FoodDetailsRepository(dio: Dio()))
        ..fetchFoodDetails(),
      child: Scaffold(
        body: BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
          builder: (context, state) {
            if (state is FoodDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FoodDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is FoodDetailsLoaded) {
              final food = state.food;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 250,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(food.dishName, style: const TextStyle(fontSize: 16)),
                      background: Image.network(
                        food.dishImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.orange),
                        onPressed: () {
                          context.push(AppRouter.kFavorite);
                        },
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text(food.chefLocation)),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              food.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 20),
                              const SizedBox(width: 4),
                              Text(food.avgRate),
                              const SizedBox(width: 12),
                              const Icon(Icons.delivery_dining, size: 20),
                              const SizedBox(width: 4),
                              const Text("Free"),
                              const SizedBox(width: 12),
                              const Icon(Icons.timer, size: 20),
                              const SizedBox(width: 4),
                              const Text("20 min"),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text("SIZE:", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const SizeSelector(),
                          const SizedBox(height: 24),
                          const Text("INGREDIENTS:", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.orange[50],
                              radius: 24,
                              child: Text(
                                food.ingredient[0],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: const [
                              Text(
                                "\$32",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              QuantitySelector(),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                context.push(AppRouter.kCartView);
                              },
                              child: const Text(
                                "ADD TO CART",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
