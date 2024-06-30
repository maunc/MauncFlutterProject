import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_utils.dart';

void showGetXSnackBar(
    {String title = "", String content = "", int showTimeSeconds = 3}) {
  if (Get.isSnackbarOpen) {
    return;
  }
  Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.blue,
    colorText: Colors.white,
    duration: Duration(seconds: showTimeSeconds),
    onTap: (snack) {
      LogUtils.log("点击了SnackBar");
    },
  );
}

void showGetXDialog({String title = "", String content = ""}) {
  Get.defaultDialog(title: title, middleText: content);
}
