import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';

import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chat/data/models/chat_user_model.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:svg_flutter/svg.dart';

class ChatListScreen extends StatelessWidget {
  final List<ChatUser> chatUsers = [
    ChatUser(
      id: 'user1',
      name: 'Ali',
      imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      lastMessage: 'Hey, how are you doing?',
      unreadCount: 2,
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    ChatUser(
      id: 'user2',
      name: 'Nada',
      imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
      lastMessage: 'The meeting is at 3pm',
      unreadCount: 0,
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    ChatUser(
      id: 'user3',
      name: 'Abdallah',
      imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      lastMessage: 'Please send me the documents',
      unreadCount: 5,
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: 10,
            child: SvgPicture.asset(Assets.assetsImagesIcon),
          ),
        ),
        title: Text(
          'Chats',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (context, index) {
          final user = chatUsers[index];
          return ChatListItem(
            user: user,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(userId: user.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final ChatUser user;
  final VoidCallback onTap;

  const ChatListItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.imageUrl),
        radius: 28,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              user.name,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            DateFormat('h:mm a').format(user.lastMessageTime),
            style: Styles.textStyle12.copyWith(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              user.lastMessage,
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
