import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.chatMessage,
    required this.isSender,
  });

  final MessageModel chatMessage;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
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
}
