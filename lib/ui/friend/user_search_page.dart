import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/friend_controller.dart';
import 'package:short_book/controller/user_search_controller.dart';
import 'package:short_book/ui/friend/user_search_result.dart';

class UserSearchPage extends GetView<UserSearchController> {
  final _inputController = TextEditingController();
  UserSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchAppBar(),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildSearchResult(),
        ],
      ),
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_rounded),
      ),
      title: Text("친구 추가"),
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        TextButton(
          child: const Text("확인"),
          onPressed: () => controller.getUser(_inputController.text),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _inputController,
        decoration: InputDecoration(
            helperText: "helper",
            helperStyle: Get.textTheme.labelSmall,
            hintText: "친구 닉네임 입력",
            hintStyle: Get.textTheme.labelLarge),
      ),
    );
  }

  Widget _buildSearchResult() {
    return Obx(() {
      return UserSearchResult(controller.searchResult);
    });
  }
}
