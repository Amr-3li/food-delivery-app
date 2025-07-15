import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/chat/data/models/conversation_model.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';
import 'package:restaurant/features/chat/data/repository/conversation_abstract_repo.dart';
import 'package:restaurant/features/chat/data/service_api/conversation_api.dart';

class ConversationRepository extends ConversationAbstractRepo {
  final ConversationApiService apiService;

  ConversationRepository(this.apiService);

  @override
  Future<Either<Failure, ConversationModel>> getConversation(int id) async {
    try {
      final result = await apiService.getConversation(id);
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageModel>> sendMessage({
    required int recieverId,
    required String content,
  }) async {
    try {
      final result = await apiService.sendMessage(
        recieverId: recieverId,
        content: content,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ConversationPreviewModel>>>
  getAllConversations() async {
    try {
      final result = await apiService.getAllConversations();
      return Right(result);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
