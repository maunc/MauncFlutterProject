import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../bean/tt_bean.dart';
import '../../utils/log_utils.dart';

const channel = MethodChannel("android_channel_name");

class HomeController extends GetxController {
  var ttBean = Rxn<TtBean>();

  var currentIndex = 0;

  @override
  void onInit() {
    super.onInit();
    LogUtils.log("home_controller_onInit");
  }

  @override
  void onReady() {
    super.onReady();
    LogUtils.log("home_controller_onReady");
  }

  @override
  void onClose() {
    super.onClose();
    LogUtils.log("home_controller_onClose");
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
