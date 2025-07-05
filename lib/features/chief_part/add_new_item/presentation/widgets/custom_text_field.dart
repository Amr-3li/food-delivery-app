import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/core/helper/app_validator.dart';
import 'package:restaurant/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final AppValidator? validator;
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double? height;
  final TextAlign textAlignVertical;
  // ignore: annotate_overrides, overridden_fields
  final Key? key;

  const CustomTextField({
    this.key,
    this.validator,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.height,
    this.textAlignVertical = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56,
      child: TextFormField(
        key: key,
        controller: controller,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        validator: validator?.validate,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLines: obscureText ? 1 : null,
        textAlignVertical: TextAlignVertical.top,
        expands: !obscureText && height != null,
        decoration: InputDecoration(
          prefix: const SizedBox(width: 20),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          hintText: hintText,
          hintStyle: Styles.textStyle14.copyWith(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
