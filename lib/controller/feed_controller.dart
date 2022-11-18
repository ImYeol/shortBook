import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/relay_book.dart';
import 'package:short_book/data/repository/feed_service.dart';

class FeedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _controller;
  //List<UserInfo> get friends => _repository.fetchFriends().then((value) => null);
  TabController get tabController => _controller;

  List<RelayBook> get request => Get.find<FeedService>().feedMessages;

  @override
  void onInit() {
    super.onInit();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }

  void gotoWritingPage(RelayBook relayBook) async {
    final isCompleted = await Get.toNamed(AppRoute.BOOK_WRITING,
        arguments: {'relayBook': relayBook});
    if (isCompleted ?? false) {
      print("completed");
    }
  }
}
