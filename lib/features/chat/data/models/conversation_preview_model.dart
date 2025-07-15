import 'package:restaurant/features/chat/data/models/message_model.dart';
import 'package:restaurant/features/chat/data/models/user_model_message.dart';

class ConversationPreviewModel {
  final int id;
  final UserModelMessage otherParty;
  final MessageModel lastMessage;
  final int unreadCount;
  final String lastMessageAt;
  final String createdAt;

  ConversationPreviewModel({
    required this.id,
    required this.otherParty,
    required this.lastMessage,
    required this.unreadCount,
    required this.lastMessageAt,
    required this.createdAt,
  });

  factory ConversationPreviewModel.fromJson(Map<String, dynamic> json) {
    return ConversationPreviewModel(
      id: json['id'],
      otherParty: UserModelMessage.fromJson(json['other_party']),
      lastMessage: MessageModel.fromJson(json['last_message']),
      unreadCount: json['unread_count'],
      lastMessageAt: json['last_message_at'],
      createdAt: json['created_at'],
    );
  }
}
