import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/friend_controller.dart';
import 'package:short_book/ui/friend/friend_list_item.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("friend");
    // return Scaffold(
    //   appBar: _buildAppBar(),
    //   body: Column(
    //     children: [_buildTitleView(), _buildFriendListView()],
    //   ),
    // );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.person_add_alt_outlined))
      ],
    );
  }

  Widget _buildTitleView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          AppConfig.defaultTitleViewLeftPadding,
          AppConfig.defaultTitleViewTopPadding,
          AppConfig.defaultTitleViewRightPadding,
          AppConfig.defaultTitleViewBottomPadding),
      child: Text(
        "친구",
        style: Get.textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildFriendListView() {
    return Obx(() {
      return ListView.builder(
        itemBuilder: ((context, index) =>
            FriendListItem(controller.friends[index])),
        itemCount: controller.friends.length,
      );
    });
  }
}
