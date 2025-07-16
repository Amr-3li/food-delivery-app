import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_cubit.dart';
import 'package:restaurant/features/food_categories/cubit/food_cubit.dart';
import 'package:restaurant/features/food_categories/cubit/food_state.dart';

import 'package:restaurant/features/food_categories/data/food_repository.dart';

import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
import '../widgets/food_item_card.dart';
import '../widgets/category_selector.dart';
import '../widgets/open_restaurants_section.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  String selectedCategory = 'breakfast';

  @override
  void initState() {
    super.initState();
    context.read<FoodUserCubit>().fetchAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartCubit(cartRepository: sl<CartRepository>()),
        ),
        BlocProvider(
          create: (_) =>
              FoodUserCubit(sl<FoodUserRepository>())..fetchAllFoods(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 10),
                      CategorySelector(
                        selectedCategory: selectedCategory,
                        onCategorySelected: (value) {
                          setState(() => selectedCategory = value);
                        },
                      ),
                      const Spacer(),
                      const Icon(Icons.search),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const FilterSheet(),
                          );
                        },
                        icon: const Icon(Icons.tune),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Popular ${selectedCategory[0].toUpperCase()}${selectedCategory.substring(1)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// BlocBuilder for Food
                  BlocBuilder<FoodUserCubit, FoodUserState>(
                    builder: (context, state) {
                      if (state is FoodUserSLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is FoodUserSFailure) {
                        return Text(state.error);
                      } else if (state is FoodUserSSuccess) {
                        final filteredFoods = state.foods
                            .where(
                              (food) =>
                                  food.mealType.toLowerCase() ==
                                  selectedCategory.toLowerCase(),
                            )
                            .toList();

                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75,
                              ),
                          itemCount: filteredFoods.length,
                          itemBuilder: (context, index) {
                            final food = filteredFoods[index];
                            return FoodItemCard(
                              title: food.name,
                              subtitle: food.mealType,
                              price: "100",
                              image: food.image,
                              onTap: () => context.push(
                                AppRouter.kFoodDetailsScreenView,
                              ),
                              onTapAdd: () {
                                context.read<CartCubit>().addToCart(
                                  dishId: food.id,
                                  sizeId: 1,
                                  quantity: 1,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${food.name} added to cart'),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "Open Restaurants",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => context.push(AppRouter.kRestaurantViewVersion),
                    child: const OpenRestaurantsSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
