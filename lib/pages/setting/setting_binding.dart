import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
