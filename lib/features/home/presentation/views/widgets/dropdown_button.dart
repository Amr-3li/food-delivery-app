import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}
List<String> places = [" office new ", "DropdownButton", "Halal Lab "];

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedPlace = places[0];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedPlace,
      elevation: 2,
      icon: Icon(Icons.arrow_drop_down),
      isExpanded: true,
      items: places.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: Styles.textStyle14.copyWith(fontSize: 15.sp),),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedPlace = newValue;
        });
      },
    );
  }
}