import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';

abstract class MessagesRepository {
  Future<Either<String, MessagesModel>> getAllMessages();
  Future<Either<String, ChatModel>> getChat({required int id});
  Future<String> sendMessage({required int id, String? message, XFile? image , required String type});
  Future<Either<String, String>> deleteMessage({required int id});
}