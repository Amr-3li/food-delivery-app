import 'package:flutter/material.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool isDefault = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Set This Address As Default Address',
          textAlign: TextAlign.center,
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Switch(
          value: isDefault,
          onChanged: (value) {
            setState(() {
              isDefault = value;
            });

            widget.onChanged(value);
          },
          activeColor: ColorsHelper.orange,
        ),
      ],
    );
  }
}