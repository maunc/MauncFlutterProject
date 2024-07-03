import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/main/main_controller.dart';

import '../../ext/ext_common.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    logD("MainBinding-->dependencies");
  }
}
