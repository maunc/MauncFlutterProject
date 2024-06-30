import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:maunc_flutter_project/pages/home/home_binding.dart';

import '../pages/home/home_page.dart';

class RoutePage {
  static const String home = "/home";

  static final List<GetPage> getPages = [
    GetPage(
      name: home,
      binding: HomeBinding(),
      page: () => const HomePage(),
      children: [],
    ),
  ];
}
