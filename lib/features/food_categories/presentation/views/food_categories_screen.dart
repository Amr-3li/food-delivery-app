import 'package:flutter/material.dart';
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
                const Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    CategorySelector(),
                    Spacer(),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Icon(Icons.tune), // filter icon
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
                  children: const [
                    FoodItemCard(
                      title: "Burger Bistro",
                      subtitle: "Rose Garden",
                      price: "\$40",
                    ),
                    FoodItemCard(
                      title: "Smokin' Burger",
                      subtitle: "Cafenio Restaurant",
                      price: "\$60",
                    ),
                    FoodItemCard(
                      title: "Buffalo Burgers",
                      subtitle: "Kaji Firm Kitchen",
                      price: "\$75",
                    ),
                    FoodItemCard(
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
                const OpenRestaurantsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
