import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';
import '../models/conversation_model.dart';

class ConversationApiService {
  final Dio dio;

  ConversationApiService(this.dio);
  Map<String, dynamic> _getHeaders() {
    return {
      'Authorization':
          'Bearer 6|zq3OU0soHfdRsznwTWCxzn3Jk7Ouzut5hbHbNmeDe4ffe4a8',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<ConversationModel> getConversation(int conversationId) async {
    final response = await dio.get(
      '${APIKey.baseApiUrl}/conversations/7',
      options: Options(headers: _getHeaders()),
    );

    if (response.statusCode == 200) {
      return ConversationModel.fromJson(response.data['data']['conversation']);
    } else {
      throw Exception('Failed to load conversation');
    }
  }

  Future<List<ConversationPreviewModel>> getAllConversations() async {
    final response = await dio.get('${APIKey.baseApiUrl}/conversations');
    final List data = response.data['data']['conversations'];
    return data.map((e) => ConversationPreviewModel.fromJson(e)).toList();
  }

  // Send message to a conversation
  Future<MessageModel> sendMessage({
    required int recieverId,
    required String content,
    String type = 'text',
  }) async {
    final response = await dio.post(
      '${APIKey.baseApiUrl}/messages/send',
      data: {'type': type, 'content': content, "receiver_id": recieverId},
    );
    return MessageModel.fromJson(response.data['data']);
  }
}
