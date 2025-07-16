import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/food_categories/data/food_model.dart';
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
  List<FoodModel> foods = [];

  @override
  void initState() {
    super.initState();
    fetchFoodsByCategory(selectedCategory);
  }

  Future<void> fetchFoodsByCategory(String category) async {
    final allFoods = await FoodRepository().getAllFoods();

    final filtered = allFoods.where(
      (food) => food.mealType.toLowerCase() == category.toLowerCase(),
    ).toList();

    setState(() {
      foods = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    CategorySelector(
                      selectedCategory: selectedCategory,
                      onCategorySelected: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                        fetchFoodsByCategory(value);
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
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return FoodItemCard(
                          onTap: () {
                          context.push(AppRouter.kFoodDetailsScreenView);
                              },
                         title: food.name,
                              subtitle: food.mealType,
                                price: '',
                                image: food.image,
                                 );

                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Open Restaurants",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.push(AppRouter.kRestaurantViewVersion);
                  },
                  child: const OpenRestaurantsSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
