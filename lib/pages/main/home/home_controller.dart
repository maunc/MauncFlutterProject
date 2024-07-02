import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';
import 'package:maunc_flutter_project/bean/today_in_history_bean.dart';
import 'package:maunc_flutter_project/http/net_work_service.dart';

class HomeController extends BaseGetxController {
  var isShowProgress = true.obs;

  var toDayInHistoryData = Rxn<TodayInHistoryBean>();

  @override
  void onInit() {
    super.onInit();
    getTodayInHistory();
  }

  void getTodayInHistory() {
    ApiService.getToDayInHistoryData(
      (successData) {
        isShowProgress.value = false;
        toDayInHistoryData.value = successData;
      },
      (errorMsg) {
        isShowProgress.value = false;
      },
    );
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
