import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';

abstract class BaseGetxController extends GetxController {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivityInitState();
    LogUtils.log("$runtimeType--->onInit");
  }

  @override
  void onReady() {
    super.onReady();
    LogUtils.log("$runtimeType--->onReady");
  }

  @override
  void onClose() {
    super.onClose();
    connectivityDispose();
    LogUtils.log("$runtimeType--->onClose");
  }

  void netWorkCallBack(bool isNetWork);

  void connectivityInitState() {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.none:
          LogUtils.log("无网");
          netWorkCallBack(false);
          break;
        case ConnectivityResult.bluetooth:
          break;
        case ConnectivityResult.wifi:
          LogUtils.log("网络连接成功 wifi");
          netWorkCallBack(true);
          break;
        case ConnectivityResult.ethernet:
          break;
        case ConnectivityResult.mobile:
          LogUtils.log("网络连接成功  mobile");
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
