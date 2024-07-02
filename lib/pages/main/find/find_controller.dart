import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';
import 'package:maunc_flutter_project/bean/image_list_bean.dart';

import '../../../http/net_work_service.dart';

class FindController extends BaseGetxController {
  var swiperController = SwiperController();

  var imageListData = Rxn<ImageListBean>();

  @override
  void onInit() {
    super.onInit();
    getImageList();
  }

  void getImageList() {
    ApiService.getImageListData((successData) {
      imageListData.value = successData;
    }, (errorMsg) {});
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
