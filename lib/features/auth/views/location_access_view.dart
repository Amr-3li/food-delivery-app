import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/manger/location_access/location_access_cubit.dart';
import 'package:restaurant/features/auth/views/widgets/location_access_view_body.dart';

class LocationAccessView extends StatelessWidget {
  const LocationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LocationAccessCubit()..requestLocationAccessPermission(),
        child: LocationAccessViewBody(),
      ),
    );
  }
}
