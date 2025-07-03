// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant/core/assets_data.dart';
import 'package:restaurant/features/auth/views/login_view.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
     {

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
        children: [          Image.asset(
            AssetsData.logo,
          ),

        ],
      ),
    );
  }

  
  void delayedMethod() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      ),
    );
  }
}
