import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_address_item.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/icons.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: ListView.separated(
          itemBuilder: (context, index) => CustomAddressItem(address: '2464 Royal Ln. Mesa, New Jersey 45463', icon: Assets.assetsHome, title: 'Home'),
          separatorBuilder: (context, index) => SizedBox(height: 14,),
          itemCount: 2)
    );
  }
}

