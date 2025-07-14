import 'package:dio/dio.dart';

import 'package:restaurant/core/constant_text.dart';

Dio createDioWithAuth() {
  final dio = Dio(
    BaseOptions(
      baseUrl: APIKey.baseApiUrl,
      headers: {
        'Authorization':
            'Bearer 31|VSH7hXMuyRHRefKgfXifdbdJf0jTN8q3NhanvZWQ3d8c20e2',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ),
    InterceptorsWrapper(
      onError: (DioException e, handler) {
        if (e.type == DioExceptionType.connectionError ||
            e.error.toString().contains('SocketException')) {}

        return handler.next(e); // Let Dio continue passing the error
      },
    ),
  ]);

  return dio;
}
