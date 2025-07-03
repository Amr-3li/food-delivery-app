import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_address_item.dart';

import '../../../../../core/icons.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: ListView.separated(
        itemBuilder: (context, index) => CustomAddressItem(
          address: '2464 Royal Ln. Mesa, New Jersey 45463',
          icon: AppIcons.assetsHome,
          title: 'Home',
        ),
        separatorBuilder: (context, index) => SizedBox(height: 14),
        itemCount: 2,
      ),
    );
  }
}
