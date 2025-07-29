import 'package:flutter/material.dart';
import 'package:restaurant/features/home/presentation/cubit/resturant/resturant_cubit.dart';

import '../../../data/models/restaurant_details_model.dart';

class CustomMenuItems extends StatefulWidget {
  const CustomMenuItems({super.key, required this.categories});

  final List<CategoryElement> categories;

  @override
  State<CustomMenuItems> createState() => _CustomMenuItemsState();
}

class _CustomMenuItemsState extends State<CustomMenuItems> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final category = widget.categories[index].category!.name!;
          final isSelected = selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = widget.categories[index].category?.name;
              });
              RestaurantCubit.get(context).selectCategory(category: selectedCategory!);
            },
            child: Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.orange : Colors.grey.withAlpha(100),
                ),
              ),
              backgroundColor: isSelected ? Colors.orange : Colors.white,
              padding: const EdgeInsets.all(8),
              label: Text(widget.categories[index].category?.name ?? ''),
              // onSelected: (_) => onCategorySelected(widget.categories[index]),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 8),
        itemCount: widget.categories.length,
      ),
    );
  }
}
