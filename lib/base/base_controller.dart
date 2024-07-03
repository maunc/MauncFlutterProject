import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../ext/ext_common.dart';

abstract class BaseController extends GetxController {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivityInitState();
    logD("$runtimeType--->onInit");
  }

  @override
  void onReady() {
    super.onReady();
    logD("$runtimeType--->onReady");
  }

  @override
  void onClose() {
    super.onClose();
    connectivityDispose();
    logD("$runtimeType--->onClose");
  }

  void netWorkCallBack(bool isNetWork);

  void connectivityInitState() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          logD("无网");
          netWorkCallBack(false);
          break;
        case ConnectivityResult.bluetooth:
          break;
        case ConnectivityResult.wifi:
          logD("网络连接成功 wifi");
          netWorkCallBack(true);
          break;
        case ConnectivityResult.ethernet:
          break;
        case ConnectivityResult.mobile:
          logD("网络连接成功  mobile");
          netWorkCallBack(true);
          break;
        case ConnectivityResult.vpn:
          break;
        case ConnectivityResult.other:
          break;
      }
    });
  }

  void connectivityDispose() {
    _connectivitySubscription.cancel();
  }
}
