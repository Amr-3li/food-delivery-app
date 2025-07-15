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
  late final FoodCubit _foodCubit;

  @override
  void initState() {
    super.initState();
    final apiHelper = ApiHelper();
    final mealRepository = MealRepositoryImpl(apiHelper);
    _foodCubit = FoodCubit(mealRepository);
  }

  @override
  void dispose() {
    _foodCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _foodCubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) {
              final foodDetails = state.foodDetails;
              return ListView(
                children: [
                  CustomAppBar(key: ValueKey(state)),
                  FoodHeader(
                    onChanged: (name) =>
                        context.read<FoodCubit>().updateName(name),
                    onMealTypeChanged: (type) =>
                        context.read<FoodCubit>().updateFoodType(type),
                    key: ValueKey(state),
                  ),
                  const SizedBox(height: 24),
                  ImageUploadSection(
                    onImagesChanged: (images) =>
                        context.read<FoodCubit>().updateImages(images),
                    key: ValueKey(state),
                  ),

                  DeliveryOptionsWidget(
                    priceController: TextEditingController(
                      text: foodDetails.price.toString(),
                    ),
                    onOptionSelected: (option) =>
                        context.read<FoodCubit>().updateDeliveryType(option),
                    key: ValueKey(state),
                  ),

                  DetailsTextField(
                    controller: TextEditingController(
                      text: foodDetails.description,
                    ),
                    onChanged: (description) => context
                        .read<FoodCubit>()
                        .updateDescription(description),
                    key: ValueKey(state),
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
    );
  }
}
