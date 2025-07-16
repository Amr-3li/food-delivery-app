import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_repository.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/cubit/restaurant_view_cubit.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/cubit/restaurant_view_state.dart';
import 'package:restaurant/features/restaurant_view/widgets/food_card_list.dart';
import 'package:restaurant/features/restaurant_view/widgets/category_chips.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen({super.key});

  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantViewCubit(sl<RestaurantViewRepository>())
            ..getRestaurantView(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<RestaurantViewCubit, RestaurantViewState>(
            builder: (context, state) {
              if (state is RestaurantViewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantViewLoaded) {
                final data = state.restaurantView;
                final restaurant = data.restaurant;
                final categories = data.categories;

                selectedCategory ??= categories.first;

                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(restaurant.name),
                        background: Image.network(
                          restaurant.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Text(
                            restaurant.description,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 20),
                              SizedBox(width: 4),
                              Text("4.7"),
                              SizedBox(width: 12),
                              Icon(Icons.delivery_dining, size: 20),
                              SizedBox(width: 4),
                              Text("Free"),
                              SizedBox(width: 12),
                              Icon(Icons.timer, size: 20),
                              SizedBox(width: 4),
                              Text("20 min"),
                            ],
                          ),
                          const SizedBox(height: 16),
                          CategoryChips(
                            categories: categories,
                            selectedCategory: selectedCategory!,
                            onCategorySelected: (category) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "${selectedCategory!.name} (${selectedCategory!.meals.length})",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          FoodCardList(meals: selectedCategory!.meals),
                        ]),
                      ),
                    ),
                  ],
                );
              } else if (state is RestaurantViewError) {
                return Center(child: Text("Error: ${state.message}"));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
