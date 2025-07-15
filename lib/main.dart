import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/food_categories/presentation/views/food_categories_screen.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';
import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  await CacheHelper.init();

  Stripe.publishableKey = APIKey.stripePublishableKey;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantViewScreen(),
    );
  }
}