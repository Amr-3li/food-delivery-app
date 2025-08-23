import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/views/widgets/location_access_view_body.dart';

import 'cubit/location_access/location_access_cubit.dart';

class LocationAccessView extends StatelessWidget {
  const LocationAccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LocationAccessCubit(),
        child: LocationAccessViewBody(),
      ),
    );
  }
}
