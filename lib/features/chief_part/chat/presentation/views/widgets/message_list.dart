// import 'package:flutter/material.dart';
// import 'package:restaurant/features/chat/data/models/chat_model.dart';
// import 'package:restaurant/features/chat/presentation/views/widgets/message_item.dart';

// class MessageList extends StatelessWidget {
//   const MessageList({
//     super.key,
//     required this.messages,
//     required this.currentUserId,
//   });
//   final List<ChatMessages> messages;
//   final String currentUserId;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListView.builder(
//         reverse: true,
//         itemCount: messages.length,
//         itemBuilder: (context, index) {
//           final message =
//               messages[messages.length - 1 - index]; // Reverse manually
//           final isSender = message.idFrom == currentUserId;
//           return MessageItem(chatMessage: message, isSender: isSender);
//         },
//       ),
//     );
//   }
// }
