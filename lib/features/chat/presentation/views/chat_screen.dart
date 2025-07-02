import 'package:bubble/bubble.dart';

import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chat/data/models/chat_model.dart';
import 'package:restaurant/features/chat/presentation/views/widgets/area_input.dart';
import 'package:svg_flutter/svg.dart';

import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});
  final String userId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showEmojiPicker = false;
  final FocusNode focusNode = FocusNode();
  TextEditingController textController = TextEditingController();

  final List<ChatMessages> messages = [
    ChatMessages(
      idFrom: 'user1',
      idTo: 'user2',
      timestamp: '2024-01-01 10:00:00',
      content: 'Hey, how are you?',
      type: 0,
    ),
    ChatMessages(
      idFrom: 'user2',
      idTo: 'user1',
      timestamp: '2024-01-01 10:01:00',
      content: 'I am good, thank you!',
      type: 0,
    ),
    ChatMessages(
      idFrom: 'user1',
      idTo: 'user2',
      timestamp: '2024-01-01 10:02:00',
      content: 'Great to hear that!',
      type: 0,
    ),
  ];

  final String currentUserId = 'user1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(Assets.assetsImagesIcon),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
              ),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Text(
              "User name",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                final Uri launchUri = Uri(scheme: 'tel', path: '+201009247747');
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(launchUri);
                } else {
                  throw 'Could not launch $launchUri';
                }
              },
              child: SvgPicture.asset(Assets.assetsImagesCall),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList(messages, currentUserId)),
          AreaInput(
            currentUserId: currentUserId,
            focusNode: focusNode,
            messages: messages,
            showEmojiPicker: showEmojiPicker,
            textController: textController,
          ),
        ],
      ),
    );
  }

  Widget buildMessageItem(ChatMessages chatMessage, bool isSender) {
    return Bubble(
      margin: const BubbleEdges.only(top: 10),
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      nip: isSender ? BubbleNip.rightTop : BubbleNip.leftTop,
      color: isSender ? ColorsHelper.orange : ColorsHelper.lightBabyBlue,
      child: Text(
        chatMessage.content,
        style: TextStyle(color: isSender ? Colors.white : Colors.black),
      ),
    );
  }

  Widget buildMessageList(List<ChatMessages> messages, String currentUserId) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message =
              messages[messages.length - 1 - index]; // Reverse manually
          final isSender = message.idFrom == currentUserId;
          return buildMessageItem(message, isSender);
        },
      ),
    );
  }
}
