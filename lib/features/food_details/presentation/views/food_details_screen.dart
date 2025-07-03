import 'package:flutter/material.dart';
import 'package:restaurant/features/food_details/presentation/widgets/image_header.dart';
import 'package:restaurant/features/food_details/presentation/widgets/ingredient_icons.dart';
import 'package:restaurant/features/food_details/presentation/widgets/size_selector.dart';
import 'package:restaurant/features/food_details/presentation/widgets/quantity_selector.dart';

enum FoodDetailsVersion {
  version1,
  version2,
}

class FoodDetailsScreen extends StatelessWidget {
  final FoodDetailsVersion version;

  const FoodDetailsScreen({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // ← حل مشكلة الصورة
        child: version == FoodDetailsVersion.version1
            ? _buildVersion1(context)
            : _buildVersion2(context),
      ),
    );
  }

  Widget _buildVersion1(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageHeader(version: version),
          const SizedBox(height: 24),
          const Center(child: Text("Uttora Coffee House")),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Pizza Calzone European",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 24),
          const Text("SIZE:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const SizeSelector(version: FoodDetailsVersion.version1),
          const SizedBox(height: 24),
          const Text("INGREDIENTS:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const IngredientIcons(version: FoodDetailsVersion.version1),
          const SizedBox(height: 32),
          Row(
            children: const [
              Text("\$32", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              QuantitySelector(version: FoodDetailsVersion.version1),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {},
              child: const Text("ADD TO CART", style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 32), // ← علشان الزر يبان في الآخر
        ],
      ),
    );
  }

  Widget _buildVersion2(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageHeader(version: version),
          const SizedBox(height: 24),
          const Center(child: Text("Rose Garden")),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Burger Bistro",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Maecenas sed diam eget risus varius blandit sit amet non magna.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 24),
          const Text("SIZE:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const SizeSelector(version: FoodDetailsVersion.version2),
          const SizedBox(height: 24),
          const Text("INGREDIENTS:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const IngredientIcons(version: FoodDetailsVersion.version2),
          const SizedBox(height: 32),
          Row(
            children: const [
              Text("\$32", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              QuantitySelector(version: FoodDetailsVersion.version2),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {},
              child: const Text("ADD TO CART", style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 32), // ← علشان الزر يبان في الآخر
        ],
      ),
    );
  }
}
