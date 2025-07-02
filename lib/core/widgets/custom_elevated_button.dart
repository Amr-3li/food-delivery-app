import 'package:flutter/material.dart';

import 'package:restaurant/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.buttonIcon = const SizedBox(width: .5),
    required this.onPressedFunction,

    this.alignButton = MainAxisAlignment.center,
    this.widthButton = double.infinity,
    this.textColor = Colors.white,
    required this.buttonColor,
  });
  final String buttonText;
  final Color? buttonColor;
  final Color textColor;

  final double widthButton;
  final Function()? onPressedFunction;
  final MainAxisAlignment alignButton;
  final Widget buttonIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widthButton, 55),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        buttonText,
        style: Styles.textStyle16.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
