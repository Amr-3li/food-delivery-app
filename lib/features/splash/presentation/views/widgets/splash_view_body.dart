// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant/core/cache/cache_data.dart';
import 'package:restaurant/core/cache/cache_keys.dart';

import 'package:restaurant/core/utils/assets_data.dart';

import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/cache/secure_cache_helper.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

Future<String> checkLoginStatus() async {
  final token = await SecureCacheHelper.getData(key: CacheKeys.token);
  final userName = await SecureCacheHelper.getData(key: CacheKeys.userName);

  if (token != null && userName != null) {
    debugPrint(token);
    CacheData.accessToken = token;
    CacheData.userName = userName;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return AppRouter.kLocationAccessView;
    } else {
      return AppRouter.kHomeUserView;
    }
  } else {
    return AppRouter.kLoginView;
  }
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
      body: Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              AssetsData.splachBackgroundGrey,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),


          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              AssetsData.splachBackgroundOrange,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),

          Center(child: Image.asset(AssetsData.logo))
        ],
      ),
    );
  }

  void delayedMethod() async {
    final see = await CacheHelper.getData(key: "seeOnboarding") ?? false;
    final nextRoute = await checkLoginStatus();
    debugPrint("see $see");
    Future.delayed(
      const Duration(milliseconds: 250),
      () => {
        see ? context.go(nextRoute) : context.go(AppRouter.kOnboardingView),
      },
    );
  }
}
