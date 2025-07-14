class UserModelMessage {
  final int id;
  final String name;
  final String email;
  final String? profileImage;
  final String? type;

  UserModelMessage({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.type,
  });

  factory UserModelMessage.fromJson(Map<String, dynamic> json) {
    return UserModelMessage(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profile_image'],
      type: json['type'],
    );
  }
}
