import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/custom_text_field.dart';

class PriceTextField extends StatelessWidget {
  final TextEditingController? controller;

  const PriceTextField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        controller: controller,
        hintText: "\$30",
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
