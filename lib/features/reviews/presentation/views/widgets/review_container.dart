import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/rating_row.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ReviewContainer extends StatelessWidget {
  const ReviewContainer({
    super.key,
    required this.date,
    required this.imageUrl,
    required this.rating,
    required this.reviewText,
    required this.reviewTitle,
    required this.userName,
  });
  final String imageUrl;
  final String userName;
  final String reviewText;
  final String reviewTitle;
  final String date;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(child: Image.network(imageUrl)),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsHelper.lightBabyBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: Styles.textStyle14.copyWith(
                        color: ColorsHelper.lightGrey,
                      ),
                    ),
                    // SvgPicture.asset(Assets.assetsImagesMore),
                  ],
                ),
                SizedBox(height: 1.h),
                StarRating(rating: rating),
                SizedBox(height: 1.h),
                Text(reviewTitle, style: Styles.textStyle16),
                SizedBox(height: 1.h),
                SizedBox(
                  width: 70.w,
                  child: Center(
                    child: Text(
                      reviewText,
                      style: Styles.textStyle16.copyWith(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
