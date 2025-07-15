import 'package:restaurant/features/chat/data/models/user_model_message.dart';

class MessageModel {
  final int id;
  final int conversationId;
  final UserModelMessage sender;
  final String type;
  final String content;
  final String? seenAt;
  final String createdAt;

  MessageModel({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.type,
    required this.content,
    this.seenAt,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      conversationId: json['conversation_id'],
      sender: UserModelMessage.fromJson(json['sender']),
      type: json['type'],
      content: json['content'],
      seenAt: json['seen_at'],
      createdAt: json['created_at'],
    );
  }
}
