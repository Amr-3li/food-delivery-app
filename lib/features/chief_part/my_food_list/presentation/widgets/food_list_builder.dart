import 'package:flutter/material.dart';
import 'food_item_card.dart';

class FoodListBuilder extends StatelessWidget {
  final int currentCategoryIndex;

  FoodListBuilder({super.key, required this.currentCategoryIndex});

  final List<Map<String, dynamic>> _allFoodItems = [
    {
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      'name': 'Chicken Thai Biriyani',
      'category': 'Breakfast',
      'price': '60',
      'rating': '4.9',
      'reviews': '10',
    },
    {
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      'name': 'Chicken Bhuna',
      'category': 'Breakfast',
      'price': '30',
      'rating': '4.9',
      'reviews': '10',
    },
    {
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      'name': 'Mazalichiken Halim',
      'category': 'Breakfast',
      'price': '25',
      'rating': '4.9',
      'reviews': '10',
    },
    {
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      'name': 'Spaghetti Carbonara',
      'category': 'Lunch',
      'price': '45',
      'rating': '4.7',
      'reviews': '15',
    },
    {
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      'name': 'Caesar Salad',
      'category': 'Dinner',
      'price': '35',
      'rating': '4.5',
      'reviews': '8',
    },
  ];

  List<Map<String, dynamic>> _filteredFoodItems(int index) {
    final categories = ['All', 'Breakfast', 'Lunch', 'Dinner'];
    if (index == 0) return _allFoodItems;
    final selectedCategory = categories[index];
    return _allFoodItems
        .where((item) => item['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = _filteredFoodItems(currentCategoryIndex).length;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Total $itemCount Items',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: _filteredFoodItems(currentCategoryIndex).length,
            itemBuilder: (context, index) {
              final item = _filteredFoodItems(currentCategoryIndex)[index];
              return FoodItemCard(
                imageUrl: item['imageUrl'],
                name: item['name'],
                category: item['category'],
                price: item['price'],
                rating: item['rating'],
                reviews: item['reviews'],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
