import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void increase() {
    setState(() {
      quantity++;
    });
  }

  void decrease() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton.small(
          heroTag: 'minus',
          onPressed: decrease,
          backgroundColor: Colors.deepPurple[100],
          elevation: 0,
          child: const Icon(Icons.remove, color: Colors.black),
        ),
        const SizedBox(width: 12),
        Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 12),
        FloatingActionButton.small(
          heroTag: 'plus',
          onPressed: increase,
          backgroundColor: Colors.deepPurple[100],
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ],
    );
  }
}
