import 'package:flutter/material.dart';

Widget baseScaffold({
  required Widget body,
  AppBar? appBar,
  Widget? bottomNavigationBar,
}) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: appBar ??
        AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
    body: SafeArea(
      child: body,
    ),
    bottomNavigationBar: bottomNavigationBar,
  );
}
