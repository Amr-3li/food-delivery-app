import 'package:flutter/material.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomLabelSelection extends StatefulWidget {
  const CustomLabelSelection({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<CustomLabelSelection> createState() => _CustomLabelSelectionState();
}

class _CustomLabelSelectionState extends State<CustomLabelSelection> {
  String selectedLabel = 'Home';

  final List<String> labels = ['Home', 'Work', 'Other'];

  @override
  void initState() {
    super.initState();
    widget.onChanged(selectedLabel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Label As', style: Styles.textStyle16),
        const SizedBox(height: 10),
        Row(
          children: labels.map((label) {
            final bool isSelected = selectedLabel == label;

            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLabel = label;
                    });

                    widget.onChanged(selectedLabel);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange : ColorsHelper.whiteGray,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,)
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}