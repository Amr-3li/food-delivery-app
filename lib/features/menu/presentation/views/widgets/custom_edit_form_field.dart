import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/tex_form.dart';

class CustomEditFormField extends StatelessWidget {
  const CustomEditFormField({super.key, required this.controller, required this.text, required this.hintText});

  final TextEditingController controller;
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.normal,
          )),
          const SizedBox(height: 8),
          CustomTextField(
            textLabel: hintText,
            textController: controller,
          )
        ],
      ),
    );
  }
}