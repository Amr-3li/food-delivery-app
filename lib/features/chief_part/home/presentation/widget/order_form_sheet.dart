import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'food_order_card.dart';

class OrderFormSheet {
  static void show(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'category': '#Breakfast',
        'name': 'Chicken Thai Biriyani',
        'id': '32053',
        'price': '\$60',
        'imageUrl':
            'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D', // Add image URL
      },
      {
        'category': '#Breakfast',
        'name': 'Chicken Bhuna',
        'id': '15253',
        'price': '\$30',
        'imageUrl':
            'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      },
      {
        'category': '#Breakfast',
        'name': 'Vegetarian Poutine',
        'id': '21200',
        'price': '\$35',
        'imageUrl':
            'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      },
      {
        'category': '#Breakfast',
        'name': 'Turkey Bacon Strips',
        'id': '53241',
        'price': '\$45',
        'imageUrl':
            'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
      },
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: AppResponsive.height(context, value: 812 * 0.8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Running Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return FoodOrderCard(
                      category: order['category'],
                      foodName: order['name'],
                      foodId: order['id'],
                      price: order['price'],
                      onDonePressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${order['name']} marked as done'),
                          ),
                        );
                      },
                      onCancelPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${order['name']} cancelled')),
                        );
                      },
                      imageUrl: order['imageUrl'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
