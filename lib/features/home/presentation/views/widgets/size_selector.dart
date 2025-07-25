import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/home/presentation/cubit/meal_details/meal_details_cubit.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes});

  final List<SizeModel> sizes;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.sizes[0].size?[0].toUpperCase() ?? 'S';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.sizes.map((size) {
        final isSelected = size.size![0].toUpperCase() == selectedSize;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = size.size![0].toUpperCase();
              });
              MealDetailsCubit.get(context).changeSize(sizeModel: size);
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
              child: Text(
                size.size![0].toUpperCase(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
