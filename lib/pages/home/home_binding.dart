import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/home/home_controller.dart';
import 'package:maunc_flutter_project/utils/log_utils.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    LogUtils.log("homeBinding-->dependencies");
  }
}
