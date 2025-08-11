class MessagesModel {
  MessagesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory MessagesModel.fromJson(Map<String, dynamic> json){
    return MessagesModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.conversations,
    required this.totalCount,
  });

  final List<Conversation> conversations;
  final int? totalCount;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      conversations: json["conversations"] == null ? [] : List<Conversation>.from(json["conversations"]!.map((x) => Conversation.fromJson(x))),
      totalCount: json["total_count"],
    );
  }

}

class Conversation {
  Conversation({
    required this.id,
    required this.otherParty,
    required this.lastMessage,
    required this.unreadCount,
    required this.lastMessageAt,
    required this.createdAt,
  });

  final int? id;
  final OtherParty? otherParty;
  final LastMessage? lastMessage;
  final int? unreadCount;
  final String? lastMessageAt;
  final String? createdAt;

  factory Conversation.fromJson(Map<String, dynamic> json){
    return Conversation(
      id: json["id"],
      otherParty: json["other_party"] == null ? null : OtherParty.fromJson(json["other_party"]),
      lastMessage: json["last_message"] == null ? null : LastMessage.fromJson(json["last_message"]),
      unreadCount: json["unread_count"],
      lastMessageAt: json["last_message_at"],
      createdAt: json["created_at"],
    );
  }

}

class LastMessage {
  LastMessage({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.type,
    required this.content,
    required this.seenAt,
    required this.createdAt,
  });

  final int? id;
  final int? conversationId;
  final OtherParty? sender;
  final String? type;
  final String? content;
  final dynamic seenAt;
  final String? createdAt;

  factory LastMessage.fromJson(Map<String, dynamic> json){
    return LastMessage(
      id: json["id"],
      conversationId: json["conversation_id"],
      sender: json["sender"] == null ? null : OtherParty.fromJson(json["sender"]),
      type: json["type"],
      content: json["content"],
      seenAt: json["seen_at"],
      createdAt: json["created_at"],
    );
  }

}

class OtherParty {
  OtherParty({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.type,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? type;

  factory OtherParty.fromJson(Map<String, dynamic> json){
    return OtherParty(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      profileImage: json["profile_image"],
      type: json["type"],
    );
  }

}
