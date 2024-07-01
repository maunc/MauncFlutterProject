import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  late HomeController controller;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    controller = Get.find();
    return Obx(() => _buildWidgetTree());
  }

  Widget _buildWidgetTree() {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey,
      ),
    );
  }
}
