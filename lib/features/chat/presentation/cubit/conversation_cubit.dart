import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';
import 'package:restaurant/features/chat/data/repository/conversation_implementation_repo.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_states.dart';

class ChatCubit extends Cubit<ChatState> {
  final ConversationRepository repository;

  ChatCubit(this.repository) : super(ChatInitial());

  List<ConversationPreviewModel> allConversations = [];
  List<MessageModel> messages = [];

  // Get all conversations
  Future<void> getAllConversations() async {
    emit(ChatLoading());
    final result = await repository.getAllConversations();
    result.fold((failure) => emit(ChatError(failure.errorMessage)), (data) {
      allConversations = data;
      emit(ConversationsLoaded(data));
    });
  }

  // Get messages for a conversation
  Future<void> getConversationMessages(int conversationId) async {
    emit(ChatLoading());
    final result = await repository.getConversation(conversationId);
    result.fold((failure) => emit(ChatError(failure.errorMessage)), (
      conversation,
    ) {
      messages = conversation.messages; // ✅ Extract messages
      emit(MessagesLoaded(conversation.messages));
    });
  }

  // Send a message
  Future<void> sendMessage(int recieverId, String content) async {
    emit(MessageSending());

    final result = await repository.sendMessage(
      recieverId: recieverId,
      content: content,
    );

    result.fold((failure) => emit(ChatError(failure.errorMessage)), (message) {
      messages.add(message); // ✅ Add to in-memory list
      emit(MessagesLoaded(List.from(messages))); //Force update
    });
  }

  void restoreConversationsList() {
    if (allConversations.isNotEmpty) {
      emit(ConversationsLoaded(allConversations));
    }
  }
}
