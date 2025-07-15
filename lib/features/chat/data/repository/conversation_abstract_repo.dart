import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/chat/data/models/conversation_model.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';

abstract class ConversationAbstractRepo {
  Future<Either<Failure, ConversationModel>> getConversation(int id);
  Future<Either<Failure, List<ConversationPreviewModel>>> getAllConversations();
  Future<Either<Failure, MessageModel>> sendMessage({
    required int recieverId,
    required String content,
  });
}
