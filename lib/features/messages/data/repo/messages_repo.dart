import 'package:dartz/dartz.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';

abstract class MessagesRepository {
  Future<Either<String, MessagesModel>> getAllMessages();
  Future<Either<String, ChatModel>> getChat({required int id});
}