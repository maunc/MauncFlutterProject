import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maunc_flutter_project/bean/tt_bean.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';
import 'package:maunc_flutter_project/utils/net_work_utils.dart';
import 'package:maunc_flutter_project/widgets/marquee_text_widget.dart';

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
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
                child: TextButton(
                  onPressed: testNetReq,
                  child: const Text("测试网路数据"),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MarqueeTextWidget(
                    child: Text(
                      lists[index]?.title ?? "",
                      style: const TextStyle(color: Colors.blue, fontSize: 25),
                    ),
                  );
                },
                itemCount: lists.length,
              ),
            ],
          ),
        ),
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
      var data = jsonDecode(result);
      //打印成功结果
      LogUtils.log(result);
      var ttBean = TtBean.fromJson(data);
      LogUtils.log(ttBean.msg!);
      ttBean.result?.forEach((bean) {
        lists.add(bean);
      });
      LogUtils.log("${lists.length}");
      setState(() {});
    } else {
      LogUtils.log("${response.statusCode}");
    }
    httpClient.close();
  }
}
