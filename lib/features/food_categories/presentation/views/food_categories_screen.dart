import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
import '../widgets/food_item_card.dart';
import '../widgets/category_selector.dart';
import '../widgets/open_restaurants_section.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

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
                      icon: Icon(Icons.arrow_back),
                    ),

                    SizedBox(width: 10),
                    CategorySelector(),
                    Spacer(),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const FilterSheet(),
                        );
                      },
                      icon: Icon(Icons.tune),
                    ), // filter icon
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Popular Burgers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  children: [
                    FoodItemCard(
                      onTap: () {
                        context.push(AppRouter.kFoodDetailsScreenView);
                      },
                      title: "Burger Bistro",
                      subtitle: "Rose Garden",
                      price: "\$40",
                    ),
                    FoodItemCard(
                      onTap: () {
                        context.push(AppRouter.kFoodDetailsScreenView);
                      },
                      title: "Smokin' Burger",
                      subtitle: "Cafenio Restaurant",
                      price: "\$60",
                    ),
                    FoodItemCard(
                      onTap: () {
                        context.push(AppRouter.kFoodDetailsScreenView);
                      },
                      title: "Buffalo Burgers",
                      subtitle: "Kaji Firm Kitchen",
                      price: "\$75",
                    ),
                    FoodItemCard(
                      onTap: () {
                        context.push(AppRouter.kFoodDetailsScreenView);
                      },
                      title: "Bullseye Burgers",
                      subtitle: "Kabab Restaurant",
                      price: "\$94",
                    ),
                  ],
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
