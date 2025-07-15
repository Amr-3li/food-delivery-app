import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';

import 'package:restaurant/core/icons.dart';

import 'package:restaurant/core/utils/styles.dart';

import 'package:restaurant/features/chat/data/repository/conversation_implementation_repo.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_states.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';

import 'package:svg_flutter/svg.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(sl<ConversationRepository>()),
      child: Scaffold(
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
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ConversationsLoaded) {
              return ListView.builder(
                itemCount: state.conversations.length,
                itemBuilder: (context, index) {
                  final conversation = state.conversations[index];
                  return ListTile(
                    title: Text(conversation.otherParty.name),
                    subtitle: Text(conversation.lastMessage.content),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<ChatCubit>(),
                            child: ChatScreen(
                              // conversationId: conversation.id,
                              // userName: conversation.otherParty.name,
                              // imageUrl:
                              //     conversation.otherParty.profileImage ?? '',
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is ChatError) {
              return Center(child: Text(state.message));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
