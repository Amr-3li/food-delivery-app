part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}

final class GetMessagesSuccess extends MessagesState {}

final class GetMessagesError extends MessagesState {
  final String error;

  GetMessagesError(this.error);
}

final class GetChatSuccess extends MessagesState {}

final class GetChatError extends MessagesState {
  final String error;

  GetChatError(this.error);
}

final class SendMessageSuccess extends MessagesState {
  final String messages;

  SendMessageSuccess({required this.messages});
}

final class SendMessageFailure extends MessagesState {
  final String error;

  SendMessageFailure({required this.error});
}

final class DeleteMessageSuccess extends MessagesState {
  final String messages;

  DeleteMessageSuccess({required this.messages});
}

final class DeleteMessageFailure extends MessagesState {
  final String error;

  DeleteMessageFailure({required this.error});
}