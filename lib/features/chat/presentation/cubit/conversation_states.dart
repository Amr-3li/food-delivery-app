import 'package:restaurant/features/chat/data/models/conversation_preview_model.dart';
import 'package:restaurant/features/chat/data/models/message_model.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}

class ConversationsLoaded extends ChatState {
  final List<ConversationPreviewModel> conversations;
  ConversationsLoaded(this.conversations);
}

class MessagesLoaded extends ChatState {
  final List<MessageModel> messages;
  MessagesLoaded(this.messages);
}

class MessageSending extends ChatState {}

class MessageSent extends ChatState {
  final MessageModel message;
  MessageSent(this.message);
}
