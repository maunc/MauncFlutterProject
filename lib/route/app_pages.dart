import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:maunc_flutter_project/pages/setting/setting_binding.dart';
import 'package:maunc_flutter_project/pages/setting/setting_page.dart';
import 'package:maunc_flutter_project/route/app_routes.dart';

import '../pages/main/find/find_page.dart';
import '../pages/main/home/home_page.dart';
import '../pages/main/main_binding.dart';
import '../pages/main/main_page.dart';
import '../pages/main/mine/mine_page.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: AppRoutes.main,
      binding: MainBinding(),
      page: () => const MainPage(),
    ),
    GetPage(
      name: AppRoutes.main_home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.main_find,
      page: () => FindPage(),
    ),
    GetPage(
      name: AppRoutes.main_mine,
      page: () => MinePage(),
    ),
    GetPage(
        name: AppRoutes.setting,
        binding: SettingBinding(),
        page: () => const SettingPage())
  ];
}
