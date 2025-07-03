import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/custom_text_field.dart'; // Assuming you have this

class DetailsTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  const DetailsTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = "Lorem ipsum dolor sit amet...",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'DETAILS',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomTextField(
            hintText: '',
            controller: controller,
            onChanged: onChanged,
            height: 200,
            textAlignVertical: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
