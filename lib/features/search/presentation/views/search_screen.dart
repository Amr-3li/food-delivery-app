import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import '../widgets/search_bar.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/keyword_chip.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            context.push(AppRouter.kCartView);
                          },
                          child: Icon(Icons.shopping_bag_outlined, size: 28),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                            child: Text(
                              "2",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomSearchBar(),
                const SizedBox(height: 20),
                const Text(
                  "Recent Keywords",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    KeywordChip(label: 'Burger'),
                    KeywordChip(label: 'Sandwich'),
                    KeywordChip(label: 'Pizza'),
                    KeywordChip(label: 'Sandwich'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Suggested Restaurants",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const ResturantCard(name: "Pansi Restaurant", rating: 4.7),
                const ResturantCard(
                  name: "American Spicy Burger Shop",
                  rating: 4.3,
                ),
                const ResturantCard(name: "Cafenio Coffee Club", rating: 4.0),
                const SizedBox(height: 20),
                const Text(
                  "Popular Fast Food",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(height: 100, color: Colors.grey[400]),
                          const SizedBox(height: 5),
                          const Text(
                            "European Pizza",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Uttora Coffee House",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: [
                          Container(height: 100, color: Colors.grey[400]),
                          const SizedBox(height: 5),
                          const Text(
                            "Buffalo Pizza.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Cafenio Coffee Club",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
