import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool isAndroidDevice() => Platform.isAndroid;

bool isIOSDevice() => Platform.isIOS;

Color colorSourceToHex(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

bool isEmail(String email) =>
    RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*').hasMatch(email);

MediaQueryData mediaQueryData() =>
    MediaQuery.of(navigatorKey.currentState!.overlay!.context);

/// flutter抽象出的宽度
double screenWidth() => mediaQueryData().size.width;

/// flutter抽象出的高度
double screenHeight() => mediaQueryData().size.height;

/// flutter抽象出的值 和 实际值的比例
double devicePixelRatio() => mediaQueryData().devicePixelRatio;

/// 设备实际的宽度
double screenRealWidth() => screenWidth() * devicePixelRatio();

/// 设备实际的高度
double screenRealHeight() => screenHeight() * devicePixelRatio();

/// 状态栏高度
double statusBarHeight() => mediaQueryData().padding.top;

void showGetXSnackBar({
  String title = "",
  String content = "",
  int showTimeSeconds = 3,
}) {
  if (Get.isSnackbarOpen) {
    return;
  }
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.blue,
    colorText: Colors.white,
    titleText: Text(title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        )),
    messageText: Text(content,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        )),
    duration: Duration(seconds: showTimeSeconds),
    onTap: (snack) {
      logD("点击了SnackBar");
    },
  );
}

void showGetXDialog({
  String title = "",
  String content = "",
}) {
  Get.defaultDialog(title: title, middleText: content);
}

void logD(String message) {
  if (kDebugMode) {
    print(message);
  }
}

void logDln(String message) {
  if (kDebugMode) {
    print("$message\n");
  }
}
