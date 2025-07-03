import 'package:flutter/material.dart';
import 'package:restaurant/features/restaurant_view/widgets/restaurant_header.dart';
import 'package:restaurant/features/restaurant_view/widgets/category_chips.dart';
import 'package:restaurant/features/restaurant_view/widgets/food_card_list.dart';

enum RestaurantViewVersion {
  version1,
  version2,
}

class RestaurantViewScreen extends StatelessWidget {
  final RestaurantViewVersion version;

  const RestaurantViewScreen({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: version == RestaurantViewVersion.version1
            ? _buildVersion1(context)
            : _buildVersion2(context),
      ),
    );
  }

  Widget _buildVersion1(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RestaurantHeader(version: RestaurantViewVersion.version1),
          const SizedBox(height: 16),
          const Text(
            "Spicy Restaurant",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
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
          const CategoryChips(selectedCategory: 'Burger'),
          const SizedBox(height: 24),
          const Text("Burger (10)", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const FoodCardList(),
        ],
      ),
    );
  }

  Widget _buildVersion2(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RestaurantHeader(version: RestaurantViewVersion.version2),
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
          const Text(
            "Spicy Restaurant",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Maecenas sed diam eget risus varius blandit sit amet non magna.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const CategoryChips(selectedCategory: 'Burger'),
          const SizedBox(height: 24),
          const Text("Burger (10)", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const FoodCardList(),
        ],
      ),
    );
  }
}