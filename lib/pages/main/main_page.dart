import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/bean/tt_bean.dart';
import 'package:maunc_flutter_project/pages/main/main_controller.dart';
import 'package:maunc_flutter_project/utils/get_widget_show_utils.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  List<Result?> get lists {
    return controller.ttBean.value == null
        ? []
        : controller.ttBean.value!.result ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                  showDataList(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: homeBottomNavigationBar()),
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
          icon: Icon(Icons.settings),
          label: '设置',
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
      onTap: (index) => controller.selectHomeTab(index),
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
