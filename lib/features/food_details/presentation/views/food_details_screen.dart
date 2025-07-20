import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/food_details/data/food_details_repository.dart';
import 'package:restaurant/features/food_details/presentation/cubit/food_details_cubit.dart';
import 'package:restaurant/features/food_details/presentation/cubit/food_details_state.dart';
import 'package:restaurant/features/food_details/presentation/widgets/size_selector.dart';
import 'package:sizer/sizer.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key, required this.foodId});
  final int foodId;

  Widget _buildFallbackImage() {
    return Center(
      child: Icon(Icons.fastfood, size: 40, color: Colors.grey[400]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FoodDetailsCubit(FoodDetailsRepository(dio: Dio()))
                ..fetchFoodDetails(),
        ),
        BlocProvider(
          create: (context) => CartCubit(cartRepository: sl<CartRepository>()),
        ),
      ], // ✅ Pass foodId here
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
                      title: Text(
                        food.dishName,
                        style: const TextStyle(fontSize: 16),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          image: food.dishImage.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(food.dishImage),
                                  fit: BoxFit.cover,
                                  onError: (error, stackTrace) {},
                                )
                              : null,
                        ),
                        child: food.dishImage.isEmpty
                            ? _buildFallbackImage()
                            : Image.network(
                                "https://www.shutterstock.com/image-photo/fried-salmon-steak-cooked-green-600nw-2489026949.jpg",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildFallbackImage(),
                                loadingBuilder: (context, child, progress) {
                                  if (progress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: progress.expectedTotalBytes != null
                                          ? progress.cumulativeBytesLoaded /
                                                progress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                              ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Added to favorites"),
                              backgroundColor: const Color.fromARGB(
                                255,
                                50,
                                168,
                                20,
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
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
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
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
                          const Text(
                            "SIZE:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const SizeSelector(),
                          SizedBox(height: 20.h),
                          // const Text(
                          //   "INGREDIENTS:",
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          // ),
                          // const SizedBox(height: 8),
                          // Center(
                          //   child: CircleAvatar(
                          //     backgroundColor: Colors.orange[50],
                          //     radius: 24,
                          //     child: Text(
                          //       food.ingredient.isNotEmpty
                          //           ? food.ingredient[0]
                          //           : '?',
                          //       style: const TextStyle(fontSize: 16),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 20.h),
                          // Row(
                          //   children: const [
                          //     Text(
                          //       "\$32",
                          //       style: TextStyle(
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     Spacer(),
                          //     QuantitySelector(),
                          //   ],
                          // ),
                          const SizedBox(height: 16),
                          Builder(
                            builder: (buttonContext) => SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  buttonContext.read<CartCubit>().addToCart(
                                    dishId: foodId,
                                    price: 100,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${food.dishName} added to cart',
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("ADD TO CART"),
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
