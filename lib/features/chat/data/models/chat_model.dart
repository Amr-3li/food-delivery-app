// class ChatMessages {
//   final String idFrom;
//   final String idTo;
//   final String timestamp;
//   final String content;
//   final int type; // 0 = text, 1 = image, etc.

//   ChatMessages({
//     required this.idFrom,
//     required this.idTo,
//     required this.timestamp,
//     required this.content,
//     required this.type,
//   });

//   factory ChatMessages.fromMap(Map<String, dynamic> map) {
//     return ChatMessages(
//       idFrom: map['idFrom'] ?? '',
//       idTo: map['idTo'] ?? '',
//       timestamp: map['timestamp'] ?? '',
//       content: map['content'] ?? '',
//       type: map['type'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'idFrom': idFrom,
//       'idTo': idTo,
//       'timestamp': timestamp,
//       'content': content,
//       'type': type,
//     };
//   }
// }
