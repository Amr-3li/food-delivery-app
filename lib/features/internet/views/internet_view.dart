import 'package:flutter/material.dart';
import 'package:restaurant/features/internet/views/widgets/internet_view_body.dart';

class InternetView extends StatelessWidget {
  const InternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InternetViewBody(),
    );
  }
}
