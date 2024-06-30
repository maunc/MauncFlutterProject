import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/bean/tt_bean.dart';
import 'package:maunc_flutter_project/pages/home/home_controller.dart';
import 'package:maunc_flutter_project/utils/get_widget_show_utils.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  List<Result?> get lists {
    return controller.ttBean.value == null
        ? []
        : controller.ttBean.value!.result ?? [];
  }

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: controller.historyToDayData,
                child: const Text("历史上的今天"),
              ),
              Obx(() => showDataList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget showDataList() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          child: Text(
            lists[index]?.title ?? "",
            style: const TextStyle(color: Colors.blue, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {
            showGetXSnackBar(
                title: lists[index]?.title ?? "",
                content: "发生日期：${lists[index]?.year ?? "未知"}");
          },
        );
      },
      itemCount: lists.length,
    );
  }
}
