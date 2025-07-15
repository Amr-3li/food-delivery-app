import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/repository/meal_repository_impl.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_cubit.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_state.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/custom_app_bar.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/delivery_option.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/details_field.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/image_uploader_section.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/food_header.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/save_change_button.dart';

class AddNewItems extends StatefulWidget {
  const AddNewItems({super.key});

  @override
  State<AddNewItems> createState() => _AddNewItemsState();
}

class _AddNewItemsState extends State<AddNewItems> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final apiHelper = ApiHelper();
        final mealRepository = MealRepositoryImpl(apiHelper);
        return FoodCubit(mealRepository); // will start as FoodLoaded
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<FoodCubit, FoodState>(
              builder: (context, state) {
                final foodDetails = state.foodDetails;

                // Set initial values if needed
                if (state is FoodLoaded) {
                  _priceController.text = foodDetails.price.toString();
                  _descriptionController.text = foodDetails.description;
                }

                return ListView(
                  children: [
                    const CustomAppBar(),
                    FoodHeader(
                      onChanged: (name) =>
                          context.read<FoodCubit>().updateName(name),
                      onMealTypeChanged: (type) =>
                          context.read<FoodCubit>().updateFoodType(type),
                    ),
                    const SizedBox(height: 24),
                    ImageUploadSection(
                      onImagesChanged: (images) =>
                          context.read<FoodCubit>().updateImages(images),
                    ),
                    DeliveryOptionsWidget(
                      priceController: _priceController,
                      onOptionSelected: (option) =>
                          context.read<FoodCubit>().updateDeliveryType(option),
                    ),
                    DetailsTextField(
                      controller: _descriptionController,
                      onChanged: (description) => context
                          .read<FoodCubit>()
                          .updateDescription(description),
                    ),
                    SaveChangeButton(
                      onPressed: () {
                        context.read<FoodCubit>().saveFoodDetails();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
