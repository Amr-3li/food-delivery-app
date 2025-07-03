import 'package:flutter/material.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/food_categories/presentation/views/food_categories_screen.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';
import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant/features/search/presentation/views/search_screen.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey[200],
            body: const SafeArea(
              child: FilterSheet(),
            ),
          ),
        );
      },
    );
  }
}

