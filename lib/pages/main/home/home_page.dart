import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_root_widget.dart';
import 'package:maunc_flutter_project/bean/today_in_history_bean.dart';

import '../../../ext/ext_common.dart';
import 'home_controller.dart';

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
    return baseScaffold(
      body: Container(
        width: screenWidth(),
        height: screenHeight(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            controller.isShowProgress.value
                ? _buildProgress()
                : _buildHistoryListView()
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        "历史上的今天",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildHistoryListView() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return _buildHistoryItem(
                controller.toDayInHistoryData.value?.result?[index]);
          },
          itemCount: controller.toDayInHistoryData.value?.result?.length ?? 0),
    );
  }

  Widget _buildHistoryItem(TodayInHistoryResult? result) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                child: Text(
                  "历史年份: ${result?.year}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 2, bottom: 10),
                child: Text(
                  "事件: ${result?.title}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
        onLongPress: () {
          showGetXSnackBar(
              title: "历史年份:${result?.year ?? "未知"}",
              content: result?.title ?? "");
        },
      ),
    );
  }
}
