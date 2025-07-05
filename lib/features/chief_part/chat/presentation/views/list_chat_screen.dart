import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';

import 'package:restaurant/core/icons.dart';

import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chat/data/models/chat_user_model.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/widgets/chat_list_item.dart';
import 'package:svg_flutter/svg.dart';

class ChatListScreenChief extends StatelessWidget {
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

  ChatListScreenChief({super.key});

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
            child: SvgPicture.asset(AppIcons.iIcon),
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
              GoRouter.of(context).push(AppRouter.kChatView);
            },
          );
        },
      ),
    );
  }
}
