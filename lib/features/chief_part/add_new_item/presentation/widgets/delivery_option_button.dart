import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class DeliveryOptionButton extends StatelessWidget {
  final String option;
  final String label;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const DeliveryOptionButton({
    super.key,
    required this.option,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelected(option),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSelected
                  ? Icon(Icons.check_box_outlined, color: Colors.orange)
                  : Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: Colors.grey,
                    ),
              Text(
                label,
                style: Styles.textStyle14.copyWith(color: ColorsHelper.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
