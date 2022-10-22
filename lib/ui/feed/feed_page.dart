import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Text("feed");
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [_buildTitleView(), _buildTabBar(), _buildTabBarView()],
      ),
    ));
  }

  Widget _buildTitleView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          AppConfig.defaultTitleViewLeftPadding,
          AppConfig.defaultTitleViewTopPadding,
          AppConfig.defaultTitleViewRightPadding,
          0),
      child: Text(
        "친구",
        style: Get.textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildPageTitleView(String title) {
    return Text(
      title,
      style: Get.textTheme.titleLarge,
    );
  }

  Widget _buildTabBarMenu(String title) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: Get.textTheme.labelMedium,
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        _buildTabBarMenu("메세지"),
        _buildTabBarMenu("알림"),
      ],
      controller: controller.tabController,
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(
      controller: controller.tabController,
      children: [Text("message"), Text("alarm")],
    ));
  }
}
