import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';

import '../../../../../core/widgets/tex_form.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: ColorsHelper.orange.withAlpha(50),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorsHelper.orange,
                child: Icon(
                  Icons.edit,
                  color: ColorsHelper.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        Column(
          children: [
          ],
        ),
      ],
    );
  }
}
