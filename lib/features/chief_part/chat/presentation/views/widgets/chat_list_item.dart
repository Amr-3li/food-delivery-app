// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:restaurant/core/utils/color_helper.dart';
// import 'package:restaurant/core/utils/styles.dart';
// import 'package:restaurant/features/chat/data/models/chat_user_model.dart';

// class ChatListItem extends StatelessWidget {
//   final ChatUser user;
//   final VoidCallback onTap;

//   const ChatListItem({super.key, required this.user, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onTap,
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage(user.imageUrl),
//         radius: 28,
//       ),
//       title: Row(
//         children: [
//           Expanded(
//             child: Text(
//               user.name,
//               style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Text(
//             DateFormat('h:mm a').format(user.lastMessageTime),
//             style: Styles.textStyle12.copyWith(color: Colors.grey),
//           ),
//         ],
//       ),
//       subtitle: Row(
//         children: [
//           Expanded(
//             child: Text(
//               user.lastMessage,
//               style: Styles.textStyle14.copyWith(color: Colors.grey),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           if (user.unreadCount > 0)
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 color: ColorsHelper.orange,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 user.unreadCount.toString(),
//                 style: Styles.textStyle12.copyWith(color: Colors.white),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
