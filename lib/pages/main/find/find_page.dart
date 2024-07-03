import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:maunc_flutter_project/base/base_root_widget.dart';

import '../../../ext/ext_common.dart';
import 'find_controller.dart';

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
    return baseScaffold(
      body: Container(
        width: screenWidth(),
        height: screenHeight(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchView(),
            _buildBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchView() {
    return InkWell(
      onTap: () {
        logD("点击了");
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFD5D9D5),
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        height: 40,
        child: SizedBox(
          width: screenWidth(),
          height: 40,
          child: TextField(
            cursorColor: Colors.blue,
            autofocus: false,
            //禁止编辑
            enabled: false,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: "请输入你要搜索的内容",
              hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.schedule),
              prefixIconColor: Color(0xFF818594),
              suffixIconColor: Color(0xFF818594),
            ),
            onChanged: (value) {
              logD("value:$value");
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return controller.isShowBannerProgress.value
        ? SizedBox(
            width: screenWidth(),
            height: 220,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : SizedBox(
            width: screenWidth(),
            height: 220,
            child: Swiper(
              autoplay: true,
              autoplayDelay: 3000,
              fade: 0,
              scale: 0,
              curve: Curves.easeInOut,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  clipBehavior: Clip.hardEdge, //超出部分裁剪
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1, 1),
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                      ),
                      BoxShadow(
                        offset: Offset(-1, -1),
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                      ),
                      BoxShadow(
                        offset: Offset(-1, 1),
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                      ),
                      BoxShadow(
                        offset: Offset(1, -1),
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                      ),
                    ],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.imageListData.value?.result![index].url ??
                            "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Image(
                        image: AssetImage("assets/images/black_cat.png")),
                  ),
                );
              },
              itemCount: controller.imageListData.value?.result?.length ?? 0,
            ),
          );
  }
}
