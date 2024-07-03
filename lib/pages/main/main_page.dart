import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/main/main_controller.dart';
import 'package:maunc_flutter_project/widgets/keep_alive_wrapper.dart';

import '../../base/base_root_widget.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildWidgetTree());
  }

  Widget _buildWidgetTree() {
    return baseScaffold(
      body: homePageView(),
      bottomNavigationBar: homeBottomNavigationBar(),
    );
  }

  Widget homePageView() {
    return PageView(
      controller: controller.pageViewController,
      onPageChanged: (index) => controller.selectMainTab(index),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        KeepAliveWrapper(child: controller.homePage),
        KeepAliveWrapper(child: controller.findPage),
        KeepAliveWrapper(child: controller.minePage),
      ],
    );
  }

  Widget homeBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: '首页',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.find_in_page),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '我的',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      currentIndex: controller.currentIndex.value,
      onTap: (index) => controller.selectMainTab(index),
    );
  }
}
