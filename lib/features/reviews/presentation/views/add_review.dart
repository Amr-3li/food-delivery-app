import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';

import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/add_review_form.dart';

class AddReview extends StatefulWidget {
  // final void Function(ReviewModel) onSubmit;

  const AddReview({
    super.key,
    //  required this.onSubmit
  });

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(sl<ReviewsRepositoryImplementation>()),
      child: AddReviewForm(),
    );
  }
}
