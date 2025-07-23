import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/restaurant_view/widgets/food_card_list.dart';

import '../../../home/presentation/cubit/category/category_cubit.dart';
import '../../../home/presentation/cubit/category/category_state.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(sl())..fetchCategories(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "All Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const Spacer(),
                    // const Icon(Icons.search),
                  ],
                ),
                const SizedBox(height: 20),

                /// BlocBuilder to show categories
                Expanded(
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CategoryFailure) {
                        return Center(child: Text("Error: ${state.error}"));
                      } else if (state is CategorySuccess) {
                        final categories = CategoryCubit.get(context).categories;

                        if (categories.isEmpty) {
                          return const Center(
                            child: Text("No categories found."),
                          );
                        }

                        return GridView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.85,
                              ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return FoodCardList(
                              mealId: category.id,

                              categorydescription:
                                  category.description ??
                                  "No description available",
                              categoryPrice: "\$ 120.00",
                              categoryName: category.name,
                              imageuRL: category.image,
                              onTap: () {
                                context.push(
                                  AppRouter.kFoodDetailsScreenView,
                                  extra: category.id,
                                );
                              },
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
