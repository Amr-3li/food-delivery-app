import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/review_screen_body.dart';

class ReviewResturantScreen extends StatefulWidget {
  const ReviewResturantScreen({super.key});

  @override
  State<ReviewResturantScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ReviewsCubit(sl<ReviewsRepositoryImplementation>())..fetchReviews(),
      child: ReviewResturantScreenBody(),
    );
  }
}
