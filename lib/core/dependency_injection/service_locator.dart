import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/helper/dio_with_auth.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/data/services/cart_services.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/chief_part/notification/data/api_services/notification_api_services.dart';
import 'package:restaurant/features/chief_part/notification/data/repository/notification_repository.dart';
import 'package:restaurant/features/payment/data/repository/payment_repository.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.stripe.com/v1/',
        headers: {
          'Authorization': 'Bearer ${APIKey.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
    instanceName: 'stripeDio',
  );
  sl.registerLazySingleton<Dio>(() => createDioWithAuth());
  sl.registerLazySingleton(() => CartApiServices(dio: sl()));
  sl.registerLazySingleton(() => CartRepository(sl<CartApiServices>()));
  sl.registerLazySingleton(
    () => CartCubit(cartRepository: sl<CartRepository>()),
  );

  sl.registerLazySingleton(() => NotificationServicesApi(dio: sl()));
  sl.registerLazySingleton(
    () => NotificationRepository(apiService: sl<NotificationServicesApi>()),
  );
  sl.registerFactory(() => NotificationCubit(sl<NotificationRepository>()));
  sl.registerLazySingleton(() => PaymentRepository());
  sl.registerFactory(() => PaymentCubit(sl<PaymentRepository>()));
}
