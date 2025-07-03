import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';

import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';

import 'package:restaurant/features/reviews/presentation/views/widgets/review_container.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<ReviewModel> reviews = [
    ReviewModel(
      userName: "",
      userImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
      reviewText:
          "This Food so tasty & delicious. Breakfastso fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks.",
      reviewTtitle: "Great Food and Service",
      rating: 4,
      date: DateTime.now(),
    ),
    ReviewModel(
      userName: "",
      userImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
      reviewText:
          "This Food so tasty & delicious. Breakfastso fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks.",
      reviewTtitle: "Great Food and Service",
      rating: 4,
      date: DateTime.now(),
    ),
    ReviewModel(
      userName: "",
      userImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
      reviewText:
          "This Food so tasty & delicious. Breakfastso fast Delivered in my place. Chef is very friendly. I’m really like chef for Home Food Order. Thanks.",
      reviewTtitle: "Great Food and Service",
      rating: 4,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        leading: Row(
          children: [
            SizedBox(width: 2.w),
            BackIconAppBar(onTap: () {}, iconColor: ColorsHelper.lightBabyBlue),
          ],
        ),
        title: Text("Reviews", style: Styles.textStyle17),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ReviewContainer(
                    date: reviews[index].date.toString(),
                    imageUrl: reviews[index].userImage,
                    rating: reviews[index].rating,
                    reviewText: reviews[index].reviewText,
                    reviewTitle: reviews[index].reviewTtitle,
                    userName: reviews[index].userName,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
