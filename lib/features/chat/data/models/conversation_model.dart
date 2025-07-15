import 'package:restaurant/features/chat/data/models/message_model.dart';
import 'package:restaurant/features/chat/data/models/user_model_message.dart';

class ConversationModel {
  final int id;
  final UserModelMessage customer;
  final UserModelMessage chef;
  final List<MessageModel> messages;

  ConversationModel({
    required this.id,
    required this.customer,
    required this.chef,
    required this.messages,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      customer: UserModelMessage.fromJson(json['customer']),
      chef: UserModelMessage.fromJson(json['chef']),
      messages: List<MessageModel>.from(
        json['messages'].map((e) => MessageModel.fromJson(e)),
      ),
    );
  }
}
