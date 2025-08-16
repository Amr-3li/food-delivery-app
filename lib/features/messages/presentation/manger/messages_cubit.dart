import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/core/helper/pusher_config.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';
import 'package:restaurant/features/messages/data/repo/messages_repo.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'dart:convert';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.messagesRepository) : super(MessagesInitial());

  final MessagesRepository messagesRepository;

  static MessagesCubit get(context) => BlocProvider.of(context);

  MessagesModel? messagesModel;

  /// جلب كل المحادثات
  Future<void> getMessages() async {
    final result = await messagesRepository.getAllMessages();

    result.fold((failure) => emit(GetMessagesError(failure)), (messagesModel) {
      emit(GetMessagesSuccess());
      this.messagesModel = messagesModel;
    });
  }

  ChatModel? chatModel;

  /// جلب الرسائل القديمة من API
  Future<void> getChat({required int id}) async {
    final result = await messagesRepository.getChat(id: id);

    result.fold((failure) => emit(GetChatError(failure)), (chatModel) {
      this.chatModel = chatModel;
      final newMessages = chatModel.data?.conversation?.messages ?? [];
      emit(GetChatSuccess());
    });
  }

  PusherConfig pusher = PusherConfig();

  /// تهيئة Pusher للاستماع للرسائل الجديدة
  Future<void> initPusher({required int conversationId}) async {
    await pusher.initPusher(
      (event) {

        log("📨 EVENT NAME: ${event.eventName}");
        log("📨 EVENT DATA: ${event.data}");

        if (event.eventName == 'conversation.new.message') {
          log("💬 New message received!");
          try {
            final decoded = jsonDecode(event.data);

            final messageJson = decoded['messageResource'];


            final newMessage = Message.fromJson(messageJson);

            chatModel?.data?.conversation?.messages.add(newMessage);

            emit(GetChatSuccess());
          } catch (e) {
            log("❌ Error parsing message: $e");
          }
        }

      },
      channelName: 'conversation',
      roomId: conversationId,
    );
  }

  /// عند فتح صفحة الشات
  Future<void> startChat({required int id}) async {
    await getChat(id: id); // هات الرسائل القديمة
    await initPusher(conversationId: id); // استمع للرسائل الجديدة
  }

  /// عند إغلاق الصفحة
  @override
  Future<void> close() {
    pusher.disconnect();
    return super.close();
  }

  Future<void> sendMessage({
    required int receiverId,
    String? message,
    XFile? image,
    required String type,
  }) async {
    final result = await messagesRepository.sendMessage(
      id: receiverId,
      message: message,
      image: image,
      type: type,
    );
  }

  Future<void> deleteMessage({required int id}) async {
    final result = await messagesRepository.deleteMessage(id: id);
    result.fold(
      (failure) => emit(DeleteMessageFailure(error: failure)),
      (successMessage) {
        chatModel?.data?.conversation?.messages.removeWhere((m) => m.id == id);
        emit(DeleteMessageSuccess(messages: successMessage));
      }
    );
  }

}
