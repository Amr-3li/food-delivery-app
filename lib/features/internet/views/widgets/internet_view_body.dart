import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';

class InternetViewBody extends StatelessWidget {
  const InternetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('assets/images/No Connection.json'),
        SizedBox(height: 20),
        Text(
          'No Internet Connection',
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorsHelper.orange,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'Please Check Your Internet Connection.',
          style: Styles.textStyle16,
        ),
      ],
    );
  }
}
