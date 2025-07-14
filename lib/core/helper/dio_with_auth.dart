
import 'package:dio/dio.dart';

import 'package:restaurant/core/constant_text.dart';

Dio createDioWithAuth() {
  final dio = Dio(
    BaseOptions(
      baseUrl: APIKey.baseApiUrl,
      headers: {
        'Authorization':
            'Bearer 1|nNKB1iQVaTcmyFr0A4HJu8oTUNkDEquKj0sKJgzz10f9dc40',
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
