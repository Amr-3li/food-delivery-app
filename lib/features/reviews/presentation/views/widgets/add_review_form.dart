import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/core/widgets/tex_form.dart';
import 'package:restaurant/features/reviews/presentation/cubit/reviews_cubit.dart';

import '../../../../../core/utils/app_toast.dart';


class AddReviewForm extends StatefulWidget {
  const AddReviewForm({super.key, required this.dishId});

  final int dishId;

  @override
  State<AddReviewForm> createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewsCubit, ReviewsState>(
      listener: (context, state) {
        if (state is AddReviewSuccess) {
          AppToast.showSuccessToast(state.message);
          context.pop(true);
        } else if (state is AddReviewError) {
          AppToast.showErrorToast(state.errorMessage);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              textController: _commentController,
              textLabel: "Your comment",
              maxLength: 50,
              maxLines: 3,
              textFieldSuffix: null,
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
            CustomElevatedButton(
              onPressedFunction: () {
                if (_formKey.currentState!.validate()) {
                  ReviewsCubit.get(context).addDishReviews(
                      dishId: widget.dishId,
                      rating: _rating,
                      comment: _commentController.text);
                }
              },
              buttonColor: ColorsHelper.orange,
              buttonText: "Submit Review",
            ),
          ],
        ),
      ),
    );
  }
}
