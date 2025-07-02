import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/core/widgets/tex_form.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:sizer/sizer.dart';

import 'package:restaurant/features/reviews/data/models/review_model.dart';

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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  int _rating = 0;

  void _submitReview() {
    if (_titleController.text.isEmpty ||
        _textController.text.isEmpty ||
        _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and give a rating.")),
      );
      return;
    }

    final newReview = ReviewModel(
      userName: _nameController.text,
      userImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU", // static or from user
      reviewTtitle: _titleController.text,
      reviewText: _textController.text,
      rating: _rating,
      date: DateTime.now(),
    );

    // widget.onSubmit(newReview);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 2.w),
            BackIconAppBar(onTap: () {}, iconColor: ColorsHelper.lightBabyBlue),
          ],
        ),
        title: Text("Add Review", style: Styles.textStyle17),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Name", style: Styles.textStyle14),
              SizedBox(height: 1.h),
              CustomTextField(
                textController: _nameController,
                textLabel: "Enter your name",
                textFieldSuffix: null,
                validatorFunction: (value) {
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              Text("Review Title", style: Styles.textStyle14),
              SizedBox(height: 1.h),
              CustomTextField(
                textController: _titleController,
                textLabel: "Enter Review Title",
                textFieldSuffix: null,
                validatorFunction: (value) {
                  return null;
                },
              ),
              SizedBox(height: 2.h),
              Text("Write a Review", style: Styles.textStyle14),
              SizedBox(height: 1.h),
              CustomTextField(
                textController: _textController,
                maxLength: 4,
                textLabel: "Share your experience...",
                textFieldSuffix: null,
                validatorFunction: (value) {
                  return null;
                },
              ),

              SizedBox(height: 2.h),
              Text("Your Rating", style: Styles.textStyle14),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () => setState(() => _rating = index + 1),
                  );
                }),
              ),
              SizedBox(height: 2.h),
              CustomElevatedButton(
                onPressedFunction: _submitReview,
                buttonColor: ColorsHelper.orange,
                buttonText: "Submit Review",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
