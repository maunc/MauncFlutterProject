import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchView(),
                _buildBanner(),
              ],
            )),
      ),
    );
  }

  Widget _buildSearchView() {
    return Text("data");
  }

  Widget _buildBanner() {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Swiper(
          autoplay: true,
          autoplayDelay: 3000,
          fade: 0,
          scale: 0,
          curve: Curves.easeInOut,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge, //超出部分裁剪
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.black12,
                      spreadRadius: 3.0,
                      blurRadius: 7.0),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      color: Colors.black12,
                      spreadRadius: 3.0,
                      blurRadius: 7.0),
                  BoxShadow(
                      offset: Offset(-1, 1),
                      color: Colors.black12,
                      spreadRadius: 3.0,
                      blurRadius: 7.0),
                  BoxShadow(
                      offset: Offset(1, -1),
                      color: Colors.black12,
                      spreadRadius: 3.0,
                      blurRadius: 7.0),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl:
                    controller.imageListData.value?.result![index].url ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => const Image(
                    image: AssetImage("assets/images/black_cat.png")),
              ),
            );
          },
          itemCount: controller.imageListData.value?.result?.length ?? 0),
    );
  }
}
