import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/data/repository/feed_repository.dart';

class FeedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _controller;
  //List<UserInfo> get friends => _repository.fetchFriends().then((value) => null);
  TabController get tabController => _controller;

  @override
  void onInit() {
    super.onInit();
    _controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }
}
