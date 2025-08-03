import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/presentaion/view/widget/add_new_address_view_body.dart';


import 'package:svg_flutter/svg.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/color_helper.dart';
import '../../data/repo/add_address/add_address_repo_implemation.dart';
import '../manger/add_address/add_address_cubit.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key, required this.addressesModel});

  final AddressesModel addressesModel;

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  Set<Marker> markers = {};
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    if (widget.addressesModel.lon != null && widget.addressesModel.lat != null) {
      AddAddressCubit.get(context).getAddressDetails(
        latitude: double.tryParse(widget.addressesModel.lat!)!,
        longitude: double.tryParse(widget.addressesModel.lon!)!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is GetCurrentAddressError) {
          AppToast.showErrorToast(state.error);
          GoRouter.of(context).pop();
        }
      },

      builder: (context, state) {
        if (AddAddressCubit.get(context).currentPosition != null) {
          currentPosition = AddAddressCubit.get(context).currentPosition!;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                AppResponsive.height(context, value: 300),
              ),
              child: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: true,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        currentPosition!.latitude,
                        currentPosition!.longitude,
                      ),
                      zoom: 15,
                    ),
                    markers: markers,
                    onTap: (LatLng position) {
                      markers.add(
                        Marker(
                          markerId: const MarkerId('selectedLocation'),
                          position: position,
                        ),
                      );
                      AddAddressCubit.get(context).getAddressDetails(
                        latitude: position.latitude,
                        longitude: position.longitude,
                      );
                      setState(() {});
                    },
                  ),
                  Positioned(
                    top: AppResponsive.height(context, value: 30),
                    left: AppResponsive.width(context, value: 15),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: ColorsHelper.black.withAlpha(100),
                        child: SvgPicture.asset(AppIcons.iIcon),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            body: AddAddressCubit.get(context).addressDetails != null
                ? AddNewAddressViewBody(
                    addressDetailsModel: AddAddressCubit.get(
                      context,
                    ).addressDetails!,
                    addressesModel: widget.addressesModel,
                  )
                : AddNewAddressViewBody(),
          );
        }

        return SafeArea(
          child: Scaffold(
            body: LinearProgressIndicator(color: ColorsHelper.orange),
          ),
        );
      },
    );
  }
}
