class NotificationsModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final DateTime? date; // Optional date field
  final bool isRead; // To track read status

  NotificationsModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.date,
    this.isRead = false,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'title': title,
      'subtitle': subtitle,
      'date': date?.toIso8601String(),
      'is_read': isRead,
    };
  }
}
