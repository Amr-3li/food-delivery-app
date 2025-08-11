class ChatModel {
  ChatModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory ChatModel.fromJson(Map<String, dynamic> json){
    return ChatModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.conversation,
  });

  final Conversation? conversation;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      conversation: json["conversation"] == null ? null : Conversation.fromJson(json["conversation"]),
    );
  }

}

class Conversation {
  Conversation({
    required this.id,
    required this.customer,
    required this.chef,
    required this.messages,
  });

  final int? id;
  final Chef? customer;
  final Chef? chef;
  final List<Message> messages;

  factory Conversation.fromJson(Map<String, dynamic> json){
    return Conversation(
      id: json["id"],
      customer: json["customer"] == null ? null : Chef.fromJson(json["customer"]),
      chef: json["chef"] == null ? null : Chef.fromJson(json["chef"]),
      messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
    );
  }

}

class Chef {
  Chef({
    required this.id,
    required this.name,
    required this.email,
  });

  final int? id;
  final String? name;
  final String? email;

  factory Chef.fromJson(Map<String, dynamic> json){
    return Chef(
      id: json["id"],
      name: json["name"],
      email: json["email"],
    );
  }

}

class Message {
  Message({
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
  final Sender? sender;
  final String? type;
  final String? content;
  final String? seenAt;
  final String? createdAt;

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      id: json["id"],
      conversationId: json["conversation_id"],
      sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
      type: json["type"],
      content: json["content"],
      seenAt: json["seen_at"],
      createdAt: json["created_at"],
    );
  }

}

class Sender {
  Sender({
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

  factory Sender.fromJson(Map<String, dynamic> json){
    return Sender(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      profileImage: json["profile_image"],
      type: json["type"],
    );
  }

}
