import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomMessageInfo extends StatelessWidget {
  const CustomMessageInfo({super.key, required this.conversation});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kChatView, extra: conversation.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: Image.asset(AssetsData.assetsChefProfileImage, width: 50, height: 50,),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        conversation.otherParty?.name ?? '',
                        style: Styles.textStyle16,
                      ),
                      Spacer(),
                      Text(conversation.lastMessageAt ?? ''),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(conversation.lastMessage?.content ?? '', maxLines: 1, overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}