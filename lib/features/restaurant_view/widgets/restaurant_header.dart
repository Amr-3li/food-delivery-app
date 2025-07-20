import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';

class RestaurantHeader extends StatelessWidget {
  final String imageUrl;

  const RestaurantHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Positioned(
        //   top: 12,
        //   left: 12,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: IconButton(
        //       icon: const Icon(Icons.arrow_back, color: Colors.black),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ),
        // ),
        Positioned(
          top: 12,
          right: 12,
          child: PopupMenuButton<String>(
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.more_horiz, color: Colors.black),
            ),
            onSelected: (value) {
              if (value == 'review') {
                context.push(AppRouter.kResturantReview);
              } else if (value == 'chat') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (_) => (sl<ChatCubit>()),
                      child: const ChatScreen(
                        // conversationId: 1, // Replace with actual conversation ID
                        // userName: 'User Name', // Replace with actual user name
                        // imageUrl: 'https://example.com/image.jpg', // Replace with actual image URL
                        // currentUserId: 'current_user_id', // Replace with actual current user ID
                      ),
                    ),
                  ),
                );
              } else if (value == 'order') {
                context.push(AppRouter.kOrder);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'review',
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Review'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'chat',
                child: Row(
                  children: [
                    Icon(Icons.chat, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Chat'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'order',
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Order'),
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
          ),
        ),
      ],
    );
  }
}
