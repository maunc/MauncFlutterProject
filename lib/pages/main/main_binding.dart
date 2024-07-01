import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/main/main_controller.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    LogUtils.log("MainBinding-->dependencies");
  }
}
