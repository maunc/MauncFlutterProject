import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_root_widget.dart';

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
    return baseScaffold(
      body: Container(
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
    );
  }
}
