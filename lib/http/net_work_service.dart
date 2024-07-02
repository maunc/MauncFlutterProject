import 'dart:convert';

import 'package:maunc_flutter_project/bean/today_in_history_bean.dart';

import '../bean/image_list_bean.dart';
import 'net_url_constant.dart';
import 'net_work_utils.dart';

class ApiService {
  static void getToDayInHistoryData(
    Function(TodayInHistoryBean testData) dataCallBack,
    Function(String error) errorCallBack,
  ) async {
    HttpUtils.getInstance().getRequestNotParams(AppUrlConstant.todayInHistory,
        (successData) {
      dataCallBack(TodayInHistoryBean.fromJson(jsonDecode(successData)));
    }, (errorMsg) {
      errorCallBack(errorMsg);
    });
  }

  static void getImageListData(
    Function(ImageListBean testData) dataCallBack,
    Function(String error) errorCallBack,
  ) async {
    HttpUtils.getInstance().getRequestNotParams(AppUrlConstant.imageUrl,
        (successData) {
      dataCallBack(ImageListBean.fromJson(jsonDecode(successData)));
    }, (errorMsg) {
      errorCallBack(errorMsg);
    });
  }
}
