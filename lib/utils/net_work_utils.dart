import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';

class NetWorkUtils {
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static var isConnect = false;

  static void connectivityInitState() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          LogUtils.log("无网");
          isConnect = false;
          break;
        case ConnectivityResult.bluetooth:
          break;
        case ConnectivityResult.wifi:
          LogUtils.log("网络连接成功 wifi");
          isConnect = true;
          break;
        case ConnectivityResult.ethernet:
          break;
        case ConnectivityResult.mobile:
          LogUtils.log("网络连接成功  mobile");
          isConnect = true;
          break;
        case ConnectivityResult.vpn:
          break;
        case ConnectivityResult.other:
          break;
      }
    });
  }

  static void connectivityDispose() {
    _connectivitySubscription.cancel();
  }
}
