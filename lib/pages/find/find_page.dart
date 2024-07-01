import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/pages/find/find_controller.dart';

class FindPage extends GetView<FindController> {
  FindPage({super.key});

  @override
  late FindController controller;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FindController());
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
                onPressed: controller.addCount,
                child: Text("FindPage${controller.findCount}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
