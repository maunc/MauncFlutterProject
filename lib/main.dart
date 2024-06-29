import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maunc_flutter_project/bean/test_bean.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';
import 'package:maunc_flutter_project/utils/net_wrok_utils.dart';

void main() {
  runApp(const MyApp());

  NetWorkUtils.connectivityInitState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

const channel = MethodChannel("android_channel_name");

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: testNetReq,
            child: const Text("原生请求网络"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getAndroid,
        child: const Icon(Icons.add),
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

  //原生网络请求
  void testNetReq() async {
    var httpClient = HttpClient();
    var httpUrl = "https://api.oioweb.cn/api/common/history";
    var uri = Uri.parse(httpUrl);

    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    //判断请求结果
    if (response.statusCode == HttpStatus.ok) {
      var result = await response.transform(utf8.decoder).join();
      //打印成功结果
      LogUtils.log(result);
    } else {
      LogUtils.log("${response.statusCode}");
    }
    httpClient.close();
  }
}
