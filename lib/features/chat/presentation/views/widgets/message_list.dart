import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_states.dart';
import 'package:restaurant/features/chat/presentation/views/widgets/message_item.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.currentUserId});
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is ChatError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is MessagesLoaded) {
          return ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(8),
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[state.messages.length - 1 - index];
              final isSender = message.sender.id.toString() == currentUserId;
              return MessageItem(chatMessage: message, isSender: isSender);
            },
          );
        } else if (state is ChatLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MessageSending) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Center(child: Text("No messages yet"));
      },
    );
  }
}
