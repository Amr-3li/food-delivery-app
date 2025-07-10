import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';

import 'package:restaurant/core/helper/app_router.dart';

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
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
