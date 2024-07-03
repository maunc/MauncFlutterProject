import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_binding.dart';
import 'package:maunc_flutter_project/route/app_pages.dart';
import 'package:maunc_flutter_project/route/app_routes.dart';

import 'ext/ext_common.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //启用日志
      enableLog: true,
      //去掉debug横幅
      debugShowCheckedModeBanner: false,
      //page切换动画
      defaultTransition: Transition.downToUp,
      navigatorKey: navigatorKey,
      initialBinding: BaseBinding(),
      initialRoute: AppRoutes.main,
      getPages: AppPages.getPages,
    );
  }
}
