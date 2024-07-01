import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  // List<Result?> get lists {
  //   return controller.ttBean.value == null
  //       ? []
  //       : controller.ttBean.value!.result ?? [];
  // }

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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  controller.addCount();
                },
                child: Text("HomePage${controller.homeCount}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
