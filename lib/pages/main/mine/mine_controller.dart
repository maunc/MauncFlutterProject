import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_controller.dart';

class MineController extends BaseController {
  var mineCount = 0.obs;

  void addCount() {
    mineCount.value++;
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
