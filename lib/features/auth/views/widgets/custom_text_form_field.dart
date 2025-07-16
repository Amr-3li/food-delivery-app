import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.controller,
    this.obscureText = false, required this.lableText, this.maxLines,
  });
  final String hintText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;
  final String lableText;
  final bool obscureText; 
  final int? maxLines ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
       maxLines:maxLines ,
      cursorColor: ColorsHelper.orange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: ColorsHelper.buttongrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: ColorsHelper.orange),
        // ),
        hintText: hintText,
        suffixIcon: icon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $lableText';
        } else if (lableText == 'Email' && !value.contains('@')) {
          return 'Please enter a valid $lableText';
        } else if (hintText == 'Password' && value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
    );
  }
}
