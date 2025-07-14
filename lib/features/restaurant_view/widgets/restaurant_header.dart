import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/chat/data/repository/conversation_implementation_repo.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantViewVersion version;

  const RestaurantHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: version == RestaurantViewVersion.version1 ? 180 : 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              version == RestaurantViewVersion.version1 ? 16 : 0,
            ),
          ),
          width: double.infinity,
        ),
        Positioned(
          top: 12,
          left: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: PopupMenuButton<String>(
            icon: CircleAvatar(
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
              PopupMenuItem<String>(
                value: 'review',
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Review'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
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
            offset: Offset(0, 40), // Adjust position of the popup
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
          ),
        ),
        if (version == RestaurantViewVersion.version2)
          const Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.grey),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.orange),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.grey),
              ],
            ),
          ),
      ],
    );
  }
}
