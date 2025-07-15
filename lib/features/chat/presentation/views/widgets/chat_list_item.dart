import 'package:flutter/material.dart';

import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';

class ChatListItem extends StatelessWidget {
  final ConversationPreviewModel user;
  final VoidCallback onTap;

  const ChatListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.otherParty.profileImage ?? ''),
        radius: 28,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              user.otherParty.name,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            user.lastMessageAt,
            style: Styles.textStyle12.copyWith(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              user.lastMessage.content,
              style: Styles.textStyle14.copyWith(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (user.unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: ColorsHelper.orange,
                shape: BoxShape.circle,
              ),
              child: Text(
                user.unreadCount.toString(),
                style: Styles.textStyle12.copyWith(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
