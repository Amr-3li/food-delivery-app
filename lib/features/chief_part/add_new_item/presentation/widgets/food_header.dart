import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/custom_text_field.dart';

class FoodHeader extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<int> onMealTypeChanged;
  // ignore: annotate_overrides, overridden_fields
  final Key? key;

  const FoodHeader({
    this.key,
    required this.onChanged,
    required this.onMealTypeChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodHeaderState createState() => _FoodHeaderState();
}

class _FoodHeaderState extends State<FoodHeader> {
  String selectedMeal = 'Breakfast';
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ITEM NAME',
          style: Styles.textStyle16.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: "Mzalichiken Halim",
                onChanged: widget.onChanged,
                key: widget.key,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: selectedMeal,
                underline: Container(),
                items: ['Breakfast', 'Lunch', 'Dinner'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            value,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedMeal = newValue;
                      switch (newValue) {
                        case 'Breakfast':
                          selectedValue = 1;
                          break;
                        case 'Lunch':
                          selectedValue = 2;
                          break;
                        case 'Dinner':
                          selectedValue = 3;
                          break;
                      }
                    });
                    widget.onMealTypeChanged(selectedValue);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
