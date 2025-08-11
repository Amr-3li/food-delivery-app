import 'package:flutter/material.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomMessageItem extends StatelessWidget {
  const CustomMessageItem({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: ColorsHelper.lightBabyBlue,
        borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: ColorsHelper.black.withAlpha(100),
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        message.content ?? '',
        style: Styles.textStyle16,
      ),
    );
  }
}