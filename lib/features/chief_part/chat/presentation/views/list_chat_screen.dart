import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/chat/presentation/views/chat_screen.dart';
import 'package:svg_flutter/svg.dart';

class ChatListScreenChief extends StatefulWidget {
  const ChatListScreenChief({super.key});

  @override
  State<ChatListScreenChief> createState() => _ChatListScreenChiefState();
}

class _ChatListScreenChiefState extends State<ChatListScreenChief> {
  @override
  void initState() {
    super.initState();
    // Load conversations if not already loaded
    // context.read<ChatCubit>().getAllConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
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
      // body: BlocConsumer<ChatCubit, ChatState>(
      //   listener: (context, state) {
      //     if (state is ChatError) {
      //       ScaffoldMessenger.of(
      //         context,
      //       ).showSnackBar(SnackBar(content: Text(state.message)));
      //     }
      //   },
      //   builder: (context, state) {
      //     if (state is ChatLoading &&
      //         context.read<ChatCubit>().allConversations.isEmpty) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     final conversations = context.read<ChatCubit>().allConversations;
      //     if (conversations.isEmpty) {
      //       return const Center(child: Text('No conversations found'));
      //     }
      //
      //     return RefreshIndicator(
      //       onRefresh: () async =>
      //           context.read<ChatCubit>().getAllConversations(),
      //       child: ListView.builder(
      //         itemCount: conversations.length,
      //         itemBuilder: (context, index) {
      //           final conversation = conversations[index];
      //           return ListTile(
      //             leading: CircleAvatar(
      //               backgroundImage: NetworkImage(
      //                 "https://img.freepik.com/free-psd/contact-icon-illustration-isolated_23-2151903337.jpg?semt=ais_hybrid&w=740",
      //               ),
      //             ),
      //             title: Text(conversation.otherParty.name),
      //             subtitle: Text(
      //               conversation.lastMessage.content,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //             trailing: conversation.unreadCount > 0
      //                 ? CircleAvatar(
      //                     radius: 12,
      //                     backgroundColor: Colors.orange,
      //                     child: Text(
      //                       conversation.unreadCount.toString(),
      //                       style: const TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 12,
      //                       ),
      //                     ),
      //                   )
      //                 : null,
      //             onTap: () => _navigateToChat(context, conversation),
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
    );
  }

  // void _navigateToChat(
  //   BuildContext context,
  //   ConversationPreviewModel conversation,
  // ) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => BlocProvider.value(
  //         value: context.read<ChatCubit>(),
  //         child: ChatScreenChief(
  //           conversationId: conversation.id,
  //           // userName: conversation.otherParty.name,
  //           // imageUrl: conversation.otherParty.profileImage ?? '',
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
