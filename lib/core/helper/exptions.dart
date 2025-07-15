class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ServerException extends AppException {
  final int statusCode;

  ServerException(super.message, this.statusCode);
}

class ValidationException extends AppException {
  ValidationException(super.message);
}

class NotFoundException extends AppException {
  NotFoundException(super.message);
}
