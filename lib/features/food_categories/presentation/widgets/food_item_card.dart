import 'package:flutter/material.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 80, color: Colors.grey[400]), // image placeholder
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
