import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/bean/tt_bean.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';

const channel = MethodChannel("android_channel_name");

class MainController extends GetxController {
  var ttBean = Rxn<TtBean>();

  //home底部导航栏当前选中
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    LogUtils.log("MainController_onInit");
  }

  @override
  void onReady() {
    super.onReady();
    LogUtils.log("MainController_onReady");
  }

  @override
  void onClose() {
    super.onClose();
    LogUtils.log("MainController_onClose");
  }

  void selectHomeTab(int index) {
    currentIndex.value = index;
    LogUtils.log("点击了底部导航栏：${currentIndex.value}");
  }

  void getAndroid() async {
    try {
      String result = await channel.invokeMethod("android_channel_name");
      LogUtils.log("调用成功  $result");
    } on PlatformException catch (e) {
      LogUtils.log(e.toString());
    }
  }

  //原生网络请求
  void historyToDayData() async {
    var httpClient = HttpClient();
    var httpUrl = "https://api.oioweb.cn/api/common/history";
    var uri = Uri.parse(httpUrl);

    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    //判断请求结果
    if (response.statusCode == HttpStatus.ok) {
      var result = await response.transform(utf8.decoder).join();
      var data = jsonDecode(result);
      //打印成功结果
      LogUtils.log(result);
      var reqTtBean = TtBean.fromJson(data);
      LogUtils.log(reqTtBean.msg!);
      ttBean.value = reqTtBean;
    } else {
      LogUtils.log("${response.statusCode}");
    }
    httpClient.close();
  }
}
