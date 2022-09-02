import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/friend_controller.dart';

class FriendSearchPage extends StatelessWidget {
  final FriendController _controller;
  const FriendSearchPage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchAppBar(),
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_rounded),
      ),
      title: TextField(),
      actions: [
        IconButton(
          onPressed: () => _controller.searchFriend("test"),
          icon: Icon(Icons.search),
        )
      ],
    );
  }
}
