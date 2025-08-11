import 'package:dartz/dartz.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';
import 'package:restaurant/features/messages/data/repo/messages_repo.dart';

import '../../../../core/network/api_response.dart';

class MessagesRepoImplementation implements MessagesRepository {
  static final MessagesRepoImplementation _instance = MessagesRepoImplementation._internal();
  factory MessagesRepoImplementation() {
    return _instance;
  }
  MessagesRepoImplementation._internal();


  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, MessagesModel>> getAllMessages() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.messages,
        isProtected: true,
      );

      if (response.data != null) {
        final MessagesModel messagesModel = MessagesModel.fromJson(response.data);
        return right(messagesModel);
      } else {
        return left("No messages found.");
      }
    }catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, ChatModel>> getChat({required int id}) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: '${EndPoints.messages}/$id',
        isProtected: true,
      );

      if (response.data != null) {
        final ChatModel chatModel = ChatModel.fromJson(response.data);
        return right(chatModel);
      } else {
        return left("No messages found.");
      }
    }catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return left(errorResponse.message);
    }
  }

}