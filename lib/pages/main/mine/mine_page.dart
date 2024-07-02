import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends GetView<MineController> {
  MinePage({super.key});

  @override
  late MineController controller;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MineController());
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
                child: Text("MinePage${controller.mineCount}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
