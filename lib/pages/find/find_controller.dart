import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';

class FindController extends BaseGetxController {
  var findCount = 0.obs;

  void addCount() {
    findCount.value++;
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
