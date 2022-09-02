import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  FeedPage({Key? key}) : super(key: key);

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Text("feed");
    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Column(
    //     children: [_buildTitleView(), _buildTabBar(), _buildTabBarView()],
    //   ),
    // );
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
        style: Get.textTheme.labelLarge,
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        _buildTabBarMenu("메시지"),
        _buildTabBarMenu("알림"),
      ],
      controller: _tabController,
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(
      controller: _tabController,
      children: [],
    ));
  }
}
