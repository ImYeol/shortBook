import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/feed_controller.dart';
import 'package:short_book/ui/feed/notification_view.dart';
import 'package:short_book/ui/feed/wrting_request_view.dart';

class FeedPage extends GetView<FeedController> {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Text("feed");
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [_buildTabBar(), _buildTabBarView()],
      ),
    ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: const Text("메시지", textAlign: TextAlign.left),
      titleTextStyle: Get.textTheme.displayLarge
          ?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
      toolbarHeight: Get.height / 10,
      backgroundColor: Get.theme.backgroundColor,
      elevation: 0,
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
    return SizedBox(
      width: double.infinity,
      child: TabBar(
        tabs: const [
          Text("요청"),
          Text("알림"),
        ],
        controller: controller.tabController,
        isScrollable: true,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 1,
            color: Colors.white,
          ),
          insets: EdgeInsets.fromLTRB(15, 0, 15, 0),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(
      controller: controller.tabController,
      children: [WritingRequestView(), NotificationView()],
    ));
  }
}
