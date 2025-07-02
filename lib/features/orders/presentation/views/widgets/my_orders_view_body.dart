import 'package:flutter/material.dart';

import 'custom_order_item.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView.builder(
          itemBuilder: (context, index) => CustomOrderItem(isCompleted: false),
          itemCount: 5,
        ),
        ListView.builder(
          itemBuilder: (context, index) => CustomOrderItem(isCompleted: true),
          itemCount: 5,
        ),
      ],
    );
  }
}
