// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/assets_data.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/helper/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    delayedMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Image.asset(AssetsData.logo)],
      ),
    );
  }

  void delayedMethod() async {
    final see = CacheHelper.getData(key: "seeOnboarding") ?? false;
    debugPrint(see);
    Future.delayed(
      const Duration(seconds: 2),
      () => {
        see ? context.go("/login") : context.go(AppRouter.kOnboardingView),
      },
    );
  }
}
