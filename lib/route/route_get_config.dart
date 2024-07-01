import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:maunc_flutter_project/pages/main/main_binding.dart';

import '../pages/main/main_page.dart';

class RoutePage {
  static const String main = "/main";

  static final List<GetPage> getPages = [
    GetPage(
      name: main,
      binding: MainBinding(),
      page: () => const MainPage(),
    ),
  ];
}
