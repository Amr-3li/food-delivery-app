class NotificationsModel {
  final String id;
  final String userId;
  final String title;
  final String subtitle;
  final DateTime? date;
  final bool isRead;

  NotificationsModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.subtitle,
    this.date,
    this.isRead = false,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return NotificationsModel(
      userId: data["user_id"],
      id: json['id'] ?? '',
      title: data['type'] ?? 'Notification',
      subtitle: data['message'] ?? '',
      date: data['created_at'] != null
          ? DateTime.tryParse(data['created_at'])
          : null,
      isRead: json['read_at'] != null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      'title': title,
      'subtitle': subtitle,
      'date': date?.toIso8601String(),
      'is_read': isRead,
    };
  }
}
