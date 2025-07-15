// food_list_builder.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_cubit.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_state.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/widgets/food_item_card.dart';

class FoodListBuilder extends StatelessWidget {
  final int currentCategoryIndex;

  const FoodListBuilder({super.key, required this.currentCategoryIndex});

  List<Meal> _filterFoodItems(List<Meal> items, int index) {
    final categories = ['All', 'breakfast', 'lunch', 'dinner'];
    if (index == 0) return items;
    final selectedCategory = categories[index];
    return items
        .where((item) => item.category.mealType == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodListCubit, FoodListState>(
      builder: (context, state) {
        if (state is FoodListInitial || state is FoodListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FoodListError) {
          return Center(child: Text(state.message));
        } else if (state is FoodListLoaded) {
          final filteredItems = _filterFoodItems(
            state.foodItems,
            currentCategoryIndex,
          );
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total ${filteredItems.length} Items',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return FoodItemCard(meal: item, onTap: () {});
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
