import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    required this.isRetype,
    this.originalPasswordController,
  });
  final TextEditingController controller;
  final bool isRetype;
  final TextEditingController? originalPasswordController;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsHelper.orange,
      controller: widget.controller, // Make sure to set the controller
      textInputAction: TextInputAction.done,
      obscureText: _isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.isRetype
              ? 'Please enter Re-Type Password'
              : 'Please enter your Password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        } else if (widget.isRetype) {
          // Add null check for originalPasswordController
          if (widget.originalPasswordController == null) {
            return 'Password confirmation error';
          }
          if (value != widget.originalPasswordController!.text) {
            return 'Your passwords don\'t match';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsHelper.buttongrey,
        hintText: _isObscure ? "........." : "123456789",
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: ColorsHelper.grey,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
