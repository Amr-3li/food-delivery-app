import 'package:restaurant/core/utils/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';
import '../models/conversation_model.dart';

class ConversationApiService {
  // final Dio dio;
  ApiHelper apiHelper = ApiHelper();

  ConversationApiService();
  // Map<String, dynamic> _getHeaders() {
  //   return {
  //     'Authorization':
  //         'Bearer 6|zq3OU0soHfdRsznwTWCxzn3Jk7Ouzut5hbHbNmeDe4ffe4a8',
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  // }

  Future<ConversationModel> getConversation(int conversationId) async {
    final response = await apiHelper.getRequest(
      endPoint: '${APIKey.baseApiUrl}/conversations/$conversationId',
      isProtected: true,
      isFormData: false,
    );

    if (response.statusCode == 200) {
      return ConversationModel.fromJson(response.data['data']['conversation']);
    } else {
      throw Exception('Failed to load conversation');
    }
  }

  Future<List<ConversationPreviewModel>> getAllConversations() async {
    final response = await apiHelper.getRequest(
      endPoint: '${APIKey.baseApiUrl}/conversations',
      isProtected: true,
      isFormData: false,
    );
    final List data = response.data['data']['conversations'];
    return data.map((e) => ConversationPreviewModel.fromJson(e)).toList();
  }

  // Send message to a conversation
  Future<MessageModel> sendMessage({
    required int recieverId,
    required String content,
    String type = 'text',
  }) async {
    final response = await apiHelper.getRequest(
      endPoint: '${APIKey.baseApiUrl}/messages/send',
      isProtected: true,
      data: {'type': type, 'content': content, "receiver_id": recieverId},
    );
    return MessageModel.fromJson(response.data['data']);
  }
}
