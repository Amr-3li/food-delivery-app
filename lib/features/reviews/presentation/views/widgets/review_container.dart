import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/reviews/data/models/get_reviews_model.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/rating_row.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer({super.key, required this.review});

  final Datum review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(AppIcons.iUser, width: 25, height: 25),
            ),
            SizedBox(width: AppResponsive.width(context, value: 10)),
            Column(
              children: [
                Text(
                  DateFormat(
                    "dd MMM yyyy, hh:mm a",
                  ).format(review.createdAt ?? DateTime.now()),
                  style: Styles.textStyle14.copyWith(
                    color: ColorsHelper.lightGrey,
                  ),
                ),
                SizedBox(height: 8),
                StarRating(rating: review.rating ?? 0.0),
              ],
            ),
          ],
        ),
        SizedBox(height: AppResponsive.height(context, value: 12)),
        Text(review.comment ?? '', style: Styles.textStyle16, textAlign: TextAlign.end),
      ],
    );
  }
}
