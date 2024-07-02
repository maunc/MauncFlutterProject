import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';

class MineController extends BaseGetxController {
  var mineCount = 0.obs;

  void addCount() {
    mineCount.value++;
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
