import 'dart:developer' show log;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheHelper {
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static Future<void> saveData({
    required String key,
    required String value, 
  }) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      log('Error saving secure data for key $key: $e');
    }
  }

  static Future<String?> getData({required String key}) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      log('Error reading secure data for key $key: $e');
      return null;
    }
  }

  static Future<void> removeData({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      log('Error removing secure data for key $key: $e');
    }
  }

  static Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      log('Error clearing all secure data: $e');
    }
  }
}
