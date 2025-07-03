import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant/core/constant_text.dart';
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
  sl.registerLazySingleton(() => PaymentRepository());
  sl.registerFactory(() => PaymentCubit(sl<PaymentRepository>()));
}
