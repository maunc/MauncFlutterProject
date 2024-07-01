import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_getx_controller.dart';

class HomeController extends BaseGetxController {
  var homeCount = 0.obs;

  void addCount() {
    homeCount.value++;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }

  // //原生网络请求
  // void historyToDayData() async {
  //   var httpClient = HttpClient();
  //   var httpUrl = "https://api.oioweb.cn/api/common/history";
  //   var uri = Uri.parse(httpUrl);
  //
  //   var request = await httpClient.getUrl(uri);
  //   var response = await request.close();
  //   //判断请求结果
  //   if (response.statusCode == HttpStatus.ok) {
  //     var result = await response.transform(utf8.decoder).join();
  //     var data = jsonDecode(result);
  //     //打印成功结果
  //     LogUtils.log(result);
  //     var reqTtBean = TtBean.fromJson(data);
  //     LogUtils.log(reqTtBean.msg!);
  //     ttBean.value = reqTtBean;
  //   } else {
  //     LogUtils.log("${response.statusCode}");
  //   }
  //   httpClient.close();
  // }
}
