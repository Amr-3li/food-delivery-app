import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restaurant/core/cache/cache_data.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/network/network_info.dart';
import 'package:restaurant/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_cubit.dart';
// <-- Add this import
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  // await CacheData.initialize(
  //   '15|XBQPpJMvRvQUCQufbI3Fl7OMvQTl5a9RNPJMe2oqc4067452',
  // );

  await CacheHelper.init();
  Stripe.publishableKey = APIKey.stripePublishableKey;
  sl<NetworkInfo>().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ChatCubit>(create: (_) => sl<ChatCubit>()),
            BlocProvider(create: (_) => AuthCubit(AuthRepoImplementation())),
            BlocProvider(
              create: (_) => ForgotPasswordCubit(AuthRepoImplementation()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
