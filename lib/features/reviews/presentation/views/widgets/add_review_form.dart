import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/core/widgets/tex_form.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_state.dart';
import 'package:sizer/sizer.dart';

class AddReviewForm extends StatefulWidget {
  const AddReviewForm({super.key});

  @override
  State<AddReviewForm> createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _dishIdController = TextEditingController();
  final _textController = TextEditingController();
  final _nameController = TextEditingController();
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIconAppBar(
          onTap: () => Navigator.pop(context),
          iconColor: ColorsHelper.lightBabyBlue,
        ),
        title: Text("Add Review", style: Styles.textStyle17),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: BlocConsumer<ReviewsCubit, ReviewsState>(
          listener: (context, state) {
            if (state is ReviewsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is ReviewsLoaded) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      textController: _nameController,
                      textLabel: "Your name",
                      textFieldSuffix: null,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      textController: _dishIdController,
                      textLabel: "Dish id",
                      // maxLength: 5,
                      textFieldSuffix: null,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      textController: _textController,
                      textLabel: "Your comment",
                      maxLength: 20,
                      textFieldSuffix: null,
                    ),
                    SizedBox(height: 2.h),
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
                    SizedBox(height: 3.h),
                    if (state is ReviewsLoading)
                      const CircularProgressIndicator()
                    else
                      CustomElevatedButton(
                        onPressedFunction: () {
                          context.read<ReviewsCubit>().submitReview(
                            dishId: int.parse(_dishIdController.text),
                            rating: _rating,
                            comment: _textController.text,
                          );
                        },
                        buttonColor: ColorsHelper.orange,
                        buttonText: "Submit Review",
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
