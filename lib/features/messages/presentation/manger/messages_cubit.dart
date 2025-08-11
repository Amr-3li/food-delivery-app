import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/messages/data/models/chat_model.dart';
import 'package:restaurant/features/messages/data/models/messages_model.dart';
import 'package:restaurant/features/messages/data/repo/messages_repo.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.messagesRepository) : super(MessagesInitial());

  final MessagesRepository messagesRepository;

  static MessagesCubit get(context) => BlocProvider.of(context);

  MessagesModel? messagesModel;

  void getMessages() async {
    final result = await messagesRepository.getAllMessages();

    result.fold(
      (failure) => emit(GetMessagesError(failure)),
      (messagesModel) {
        emit(GetMessagesSuccess());
        this.messagesModel = messagesModel;
      }
    );
  }

  ChatModel? chatModel;
  List<Message> messages = [];

  getChat({required int id}) async {
    final result = await messagesRepository.getChat(id: id);

    result.fold(
      (failure) => emit(GetChatError(failure)),
      (chatModel) {
        this.chatModel = chatModel;
        final newMessages = chatModel.data?.conversation?.messages ?? [];

        if (messages.isEmpty) {
          messages = newMessages;
          this.chatModel = chatModel;
          emit(GetChatSuccess());
        } else if (messages.length != newMessages.length) {
          messages = newMessages;
          emit(GetChatSuccess());
        }
      }
    );
  }

  Timer? _timer;

  void getChatPolling({required int id}) {
    getChat(id: id);

    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      getChat(id: id);
    });
  }

  void stopPolling() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    stopPolling();
    return super.close();
  }
}
