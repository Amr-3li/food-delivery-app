import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key, required this.controller, required this.isRetype, this.originalPassword,  });
final TextEditingController controller;
  final bool isRetype;
  final String? originalPassword; 
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      obscureText: _isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
      return widget.isRetype
          ? 'Please enter Re-Type Password'
          : 'Please enter your Password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (widget.isRetype && value != widget.originalPassword) {
      return 'your passwords aren\'t the same';
    }
    return null;
         
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsHelper.buttongrey,
        hintText: _isObscure ? ".........":"123456789",
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
        
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
       
      ),
      // style: const TextStyle(fontSize: 16, color: Colors.black87),
    );
  }
}
