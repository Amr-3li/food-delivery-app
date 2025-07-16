import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = '14"';

  final sizes = ['10"', '14"', '16"'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sizes.map((size) {
        final isSelected = size == selectedSize;

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = size;
              });
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
              child: Text(
                size,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
