import 'package:flutter/material.dart';

class ResturantCard extends StatelessWidget {
  final String name;
  final double rating;

  const ResturantCard({super.key, required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text(rating.toString(), style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
