import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';

class AddRemoveContainer extends StatelessWidget {
  const AddRemoveContainer({
    super.key,
    required this.onTap,
    required this.text,
    this.containerColor = Colors.black45,
    this.borderColor = Colors.black,
    this.textColor = Colors.white,
  });
  final void Function()? onTap;
  final String text;
  final Color containerColor;
  final Color borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.black12,
        radius: 15,
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle18.copyWith(
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
