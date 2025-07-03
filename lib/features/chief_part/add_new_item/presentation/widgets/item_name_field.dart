import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/custom_text_field.dart';

class ItemNameField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Key? key;

  const ItemNameField({this.key, required this.onChanged}) : super(key: key);

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
        CustomTextField(
          hintText: "Mzalichiken Halim",
          onChanged: onChanged,
          key: key, // Pass the key to CustomTextField
        ),
      ],
    );
  }
}
