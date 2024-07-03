import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
