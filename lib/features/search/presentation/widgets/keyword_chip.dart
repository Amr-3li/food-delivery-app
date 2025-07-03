import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  final String label;

  const KeywordChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.grey),
      ),
      backgroundColor: Colors.white,
    );
  }
}
