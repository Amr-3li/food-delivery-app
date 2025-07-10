class AuthResponse {
  final String message;
  final bool success;

  AuthResponse({required this.message, required this.success});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json['message'] ?? '',
      success: json['success'] ?? false,
    );
  }
}