import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';

import 'package:restaurant/core/utils/color_helper.dart';

import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/address/data/model/address_details_model.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';

import 'package:restaurant/features/address/presentaion/manger/add_address/add_address_cubit.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_label_selection.dart';

import '../../../../../core/utils/app_toast.dart';
import 'custom_add_address_filed.dart';
import 'custom_switch_widget.dart';

class AddNewAddressViewBody extends StatefulWidget {
  const AddNewAddressViewBody({
    super.key,
    this.addressDetailsModel,
    this.addressesModel,
  });

  final AddressesModel? addressesModel;
  final AddressDetailsModel? addressDetailsModel;

  @override
  State<AddNewAddressViewBody> createState() => _AddNewAddressViewBodyState();
}

class _AddNewAddressViewBodyState extends State<AddNewAddressViewBody> {
  String? label;
  bool? isDefault;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is AddNewAddressSuccess) {
          AppToast.showSuccessToast(state.message);
          GoRouter.of(context).pop(true);
        } else if (state is AddNewAddressError) {
          AppToast.showErrorToast(state.error);
        } else if (state is EditAddressSuccess) {
          AppToast.showSuccessToast(state.message);
          GoRouter.of(context).pop(true);
        } else if (state is EditAddressError) {
          AppToast.showErrorToast(state.error);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAddAddressFiled(
                title: 'Address',
                text: widget.addressDetailsModel?.displayName ?? '',
                icon: Icons.location_on,
                width: AppResponsive.width(context, value: 340),
                height: AppResponsive.height(context, value: 50),
              ),
              SizedBox(height: AppResponsive.height(context, value: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomAddAddressFiled(
                      title: 'City',
                      text: widget.addressDetailsModel?.address?.city ?? '',
                      width: AppResponsive.width(context, value: 156),
                      height: AppResponsive.height(context, value: 50),
                    ),
                  ),
                  Expanded(
                    child: CustomAddAddressFiled(
                      title: 'Post code',
                      text: widget.addressDetailsModel?.address?.postcode ?? '',
                      width: AppResponsive.width(context, value: 156),
                      height: AppResponsive.height(context, value: 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppResponsive.height(context, value: 20)),
              CustomAddAddressFiled(
                title: 'Country',
                text: widget.addressDetailsModel?.address?.country ?? '',
                width: AppResponsive.width(context, value: 340),
                height: AppResponsive.height(context, value: 50),
              ),
              SizedBox(height: AppResponsive.height(context, value: 20)),
              CustomLabelSelection(
                onChanged: (value) {
                  label = value;
                },
              ),
              SizedBox(height: AppResponsive.height(context, value: 20)),
              CustomSwitchWidget(
                onChanged: (value) {
                  isDefault = value;
                },
              ),
              SizedBox(height: AppResponsive.height(context, value: 20)),
              CustomElevatedButton(
                buttonText: 'Save location',
                onPressedFunction: () {
                  if (widget.addressDetailsModel != null && widget.addressesModel?.id == null) {
                    AddAddressCubit.get(context).addNewAddress(
                      latitude: widget.addressDetailsModel!.lat!.toString(),
                      longitude: widget.addressDetailsModel!.lon!.toString(),
                      displayName: widget.addressDetailsModel!.displayName,
                      label: label.toString(),
                      isDefault: isDefault ?? false,
                    );
                  } else if (widget.addressesModel?.id != null && widget.addressDetailsModel != null) {
                    AddAddressCubit.get(context).updateAddress(
                      addressId: widget.addressesModel!.id!,
                      latitude: widget.addressDetailsModel!.lat!.toString(),
                      longitude: widget.addressDetailsModel!.lon!.toString(),
                      displayName: widget.addressDetailsModel!.displayName,
                      label: label.toString(),
                      isDefault: isDefault ?? false,
                    );
                  }
                },
                buttonColor: ColorsHelper.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
