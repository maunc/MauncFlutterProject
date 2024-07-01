import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';

class SettingController extends BaseGetxController {
  var settingCount = 0.obs;

  void addCount() {
    settingCount.value++;
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
