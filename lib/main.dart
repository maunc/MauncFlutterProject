import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/bean/tt_bean.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';
import 'package:maunc_flutter_project/utils/net_work_utils.dart';

void main() {
  runApp(const App());

  NetWorkUtils.connectivityInitState();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, //去掉debug横幅
    );
  }
}

const channel = MethodChannel("android_channel_name");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result?> lists = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: historyToDayData,
                child: const Text("历史上的今天"),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Text(
                      lists[index]?.title ?? "",
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      showGetXSnackBar(
                          title: lists[index]?.title ?? "",
                          content: "发生日期：${lists[index]?.year ?? "未知"}");
                    },
                  );
                },
                itemCount: lists.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getAndroid() async {
    try {
      String result = await channel.invokeMethod("android_channel_name");
      LogUtils.log("调用成功  $result");
    } on PlatformException catch (e) {
      LogUtils.log(e.toString());
    }
  }

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

  //原生网络请求
  void historyToDayData() async {
    var httpClient = HttpClient();
    var httpUrl = "https://api.oioweb.cn/api/common/history";
    var uri = Uri.parse(httpUrl);

    showGetXDialog(title: "网络请求", content: "加载中。。。");

    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    //判断请求结果
    if (response.statusCode == HttpStatus.ok) {
      var result = await response.transform(utf8.decoder).join();
      var data = jsonDecode(result);
      //打印成功结果
      LogUtils.log(result);
      var ttBean = TtBean.fromJson(data);
      LogUtils.log(ttBean.msg!);
      if (lists.isNotEmpty) {
        lists.clear();
      }
      ttBean.result?.forEach((bean) {
        lists.add(bean);
      });
      LogUtils.log("${lists.length}");
      Get.back();
      setState(() {});
    } else {
      LogUtils.log("${response.statusCode}");
    }
    httpClient.close();
  }
}
