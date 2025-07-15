import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/cache/cache_keys.dart';

abstract class CacheData {
  static String? accessToken;
  static String? userName;
  static bool? firstTime;

  static Future<void> clear() async {
    await CacheHelper.removeData(key: CacheKeys.accessToken);
    await CacheHelper.removeData(key: CacheKeys.userName);
  }

  static Future<void> initialize(String initialToken) async {
    // Initialize SharedPreferences
    await CacheHelper.init();

    // Set the initial token
    accessToken = initialToken;
    await CacheHelper.saveData(key: CacheKeys.accessToken, value: initialToken);
  }
}
