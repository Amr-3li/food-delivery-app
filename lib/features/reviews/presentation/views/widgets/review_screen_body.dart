import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_state.dart';
import 'package:restaurant/features/reviews/presentation/views/add_review.dart';

import 'package:restaurant/features/reviews/presentation/views/widgets/review_container.dart';
import 'package:sizer/sizer.dart';

class ReviewResturantScreenBody extends StatelessWidget {
  const ReviewResturantScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIconAppBar(
          onTap: () => Navigator.pop(context),
          iconColor: ColorsHelper.lightBabyBlue,
        ),
        title: Text("Reviews", style: Styles.textStyle17),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: BlocBuilder<ReviewsCubit, ReviewsState>(
          builder: (context, state) {
            if (state is ReviewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReviewsError) {
              return Center(child: Text(state.message));
            } else if (state is ReviewsLoaded) {
              return ListView.builder(
                itemCount: state.reviews.length,
                itemBuilder: (context, index) {
                  final review = state.reviews[index];
                  return ReviewContainer(
                    date: review.createdAt.toString(),
                    imageUrl:
                        "https://img.freepik.com/free-psd/contact-icon-illustration-isolated_23-2151903337.jpg?semt=ais_hybrid&w=740",
                    rating: review.rating,
                    reviewText: review.comment,
                    reviewTitle: "Review",
                    userName: review.customer.name,
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddReview()),
          );
          context.read<ReviewsCubit>().fetchReviews(); // refresh after back
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
