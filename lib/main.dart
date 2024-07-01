import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/route/route_get_config.dart';
import 'package:maunc_flutter_project/utils/net_work_utils.dart';

void main() {
  runApp(const App());
  //网络监听
  NetWorkUtils.connectivityInitState();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      //去掉debug横幅
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: RoutePage.main,
      getPages: RoutePage.getPages,
    );
  }
}
