import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_controller.dart';

import 'find/find_page.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';

class MainController extends BaseController {
  //home底部导航栏当前选中
  var currentIndex = 0.obs;

  //pageViewController
  var pageViewController = PageController();

  //homePage
  var homePage = HomePage();

  //findPage
  var findPage = FindPage();

  //minePage
  var minePage = MinePage();

  void selectMainTab(int index) {
    currentIndex.value = index;
    pageViewController.jumpToPage(index);
  }

  @override
  void netWorkCallBack(bool isNetWork) {
    // TODO: implement netWorkCallBack
  }
}
