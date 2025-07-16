import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkInfo {
  static final NetworkInfo _instance = NetworkInfo._internal();
  factory NetworkInfo() => _instance;
  NetworkInfo._internal();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityResult _currentStatus = ConnectivityResult.none;

  /// هذا هو الجزء المهم اللي ناقص عندك
  final ValueNotifier<bool> isConnected = ValueNotifier(false);

  ConnectivityResult get currentStatus => _currentStatus;

  void initialize({Function(ConnectivityResult)? onChanged}) {
    _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> resultList) async {
      final result = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      _currentStatus = result;

      final hasInternet = await hasInternetAccess();
      isConnected.value = result != ConnectivityResult.none && hasInternet;

      if (onChanged != null) {
        onChanged(result);
      }
    });

    _initialCheck();
  }

  Future<void> _initialCheck() async {
    final resultList = await _connectivity.checkConnectivity();
    final result = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    _currentStatus = result;

    final hasInternet = await hasInternetAccess();
    isConnected.value = result != ConnectivityResult.none && hasInternet;
  }

  void dispose() {
    _subscription?.cancel();
  }

  Future<ConnectivityResult> checkConnectivity() async {
    final resultList = await _connectivity.checkConnectivity();
    _currentStatus = resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    final hasInternet = await hasInternetAccess();
    isConnected.value = _currentStatus != ConnectivityResult.none && hasInternet;
    return _currentStatus;
  }

  Future<bool> hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
