import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetWorkUtils {
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static var isConnect = false;

  static void connectivityInitState() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        print("无网");
        isConnect = false;
      } else if (result == ConnectivityResult.wifi) {
        print("网络连接成功 wifi");
        isConnect = true;
      } else if (result == ConnectivityResult.mobile) {
        print("网络连接成功  mobile");
        isConnect = true;
      }
    });
  }

  static void connectivityDispose() {
    _connectivitySubscription.cancel();
  }
}
