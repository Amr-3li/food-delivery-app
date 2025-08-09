import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/reviews/data/models/get_reviews_model.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/review_container.dart';

import '../../cubit/reviews_cubit.dart';

class MyReviewsViewBody extends StatelessWidget {
  const MyReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        final cubit = ReviewsCubit.get(context);
        if (cubit.myReviewsModel.isNotEmpty && state is GetReviewsSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            itemBuilder: (context, index) => ReviewContainer(review: cubit.myReviewsModel[index]),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            itemCount: cubit.myReviewsModel.length,
          );
        } else if (cubit.myReviewsModel.isEmpty && state is GetReviewsSuccess) {
          return Center(
            child: Text(
              'No reviews found',
              style: Styles.textStyle16,
            ),
          );
        }
        return LinearProgressIndicator(color: Colors.orange,);
      },
    );
  }
}
