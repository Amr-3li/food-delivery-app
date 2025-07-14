import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
<<<<<<< HEAD
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/food_categories/presentation/views/food_categories_screen.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';
import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
=======

import 'package:restaurant/core/helper/app_router.dart';

>>>>>>> 0621c0c4a2c79fe452cff1dec6da885e09a391f9
import 'package:sizer/sizer.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
await CacheHelper.init();
  runApp(const MyApp());

  Stripe.publishableKey = APIKey.stripePublishableKey;

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
<<<<<<< HEAD
          home: Scaffold(
            backgroundColor: Colors.grey[200],
            body: const SafeArea(
              child: FilterSheet(),
            ),
          ),
=======

          routerConfig: AppRouter.router,
>>>>>>> 0621c0c4a2c79fe452cff1dec6da885e09a391f9
        );
      },
    );
  }
}
