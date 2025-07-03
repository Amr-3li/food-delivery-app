import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final String selectedCategory;

  const CategoryChips({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final categories = ['Burger', 'Sandwich', 'Pizza', 'Sandwich'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = categories[index] == selectedCategory;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          );
        },
      ),
    );
  }
}