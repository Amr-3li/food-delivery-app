import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories = const [
    'breakfast',
    'lunch',
    'dinner',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: categories.contains(selectedCategory)
              ? selectedCategory
              : categories.first,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (value) {
            if (value != null) {
              onCategorySelected(value);
            }
          },
          items: categories.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(
                category.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
