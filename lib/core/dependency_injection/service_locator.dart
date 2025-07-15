import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/helper/dio_with_auth.dart';
import 'package:restaurant/features/address/data/repo/add_address/add_address_repo.dart';
import 'package:restaurant/features/address/data/repo/get_addresses/get_addresses_repo_implemation.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/data/services/cart_services.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/chat/data/repository/conversation_implementation_repo.dart';
import 'package:restaurant/features/chat/data/service_api/conversation_api.dart';
import 'package:restaurant/features/chat/presentation/cubit/conversation_cubit.dart';
import 'package:restaurant/features/chief_part/notification/data/api_services/notification_api_services.dart';
import 'package:restaurant/features/chief_part/notification/data/repository/notification_repository.dart';
import 'package:restaurant/features/payment/data/repository/payment_repository.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:restaurant/features/chief_part/notification/presentation/cubit/notification_cubit.dart';
import 'package:restaurant/features/reviews/data/api_services/review_api_services.dart';
import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';

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
  sl.registerLazySingleton(() => CartApiServices());
  sl.registerLazySingleton(() => CartRepository(sl<CartApiServices>()));
  sl.registerLazySingleton(
    () => CartCubit(cartRepository: sl<CartRepository>()),
  );

  sl.registerLazySingleton(() => NotificationServicesApi());
  sl.registerLazySingleton(
    () => NotificationRepository(apiService: sl<NotificationServicesApi>()),
  );
  sl.registerLazySingleton(
    () => NotificationCubit(repository: sl<NotificationRepository>()),
  );
  sl.registerLazySingleton(() => ReviewsApiService());
  sl.registerLazySingleton(
    () => ReviewsRepositoryImplementation(sl<ReviewsApiService>()),
  );
  sl.registerLazySingleton(
    () => ReviewsCubit(sl<ReviewsRepositoryImplementation>()),
  );
  sl.registerLazySingleton(() => ConversationApiService());
  sl.registerLazySingleton(
    () => ConversationRepository(sl<ConversationApiService>()),
  );
  sl.registerLazySingleton(() => GetAddressesRepoImplementation());
  sl.registerLazySingleton(
    () => GetAddressesCubit(sl<GetAddressesRepoImplementation>()),
  );
  sl.registerLazySingleton(() => ChatCubit(sl<ConversationRepository>()));
  sl.registerLazySingleton(() => PaymentRepository());
  sl.registerFactory(() => PaymentCubit(sl<PaymentRepository>()));
}
