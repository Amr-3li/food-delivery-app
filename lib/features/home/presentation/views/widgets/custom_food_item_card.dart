import 'package:flutter/material.dart';

import '../../../data/models/restaurant_details_model.dart';

class CustomFoodItemCard extends StatelessWidget {
  const CustomFoodItemCard({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ6X5NG7cCI7MH2q3V-t9hwAFRl84NuZ_6Sw&s'), fit: BoxFit.cover)
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(meals[index].name ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(meals[index].category?.name ?? '', style: TextStyle(color: Colors.grey)),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$ ${meals[index].sizes[0].price ?? ''}', style: TextStyle(fontWeight: FontWeight.bold)),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.orange,
                              child: Icon(Icons.add, color: Colors.white, size: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}