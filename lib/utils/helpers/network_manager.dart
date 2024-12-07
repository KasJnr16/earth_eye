import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:earth_eye_web/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus =
      <ConnectivityResult>[].obs;

  // checking internet status continually
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // updates connection status based on the changes and provides feedback
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    _connectionStatus.value = results;

    if (results.contains(ConnectivityResult.none)) {
      UniLoaders.customToast(message: "No Internet Connection");
    }
  }

  // checks internet connection, returns true if yes
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.any((element) => element == ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
