import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/user_search_binding.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/friend_controller.dart';
import 'package:short_book/ui/friend/friend_list_item.dart';
import 'package:short_book/ui/friend/user_search_page.dart';

class FriendPage extends GetView<FriendController> {
  const FriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(
            left: AppConfig.defaultHorizonPadding,
            right: AppConfig.defaultHorizonPadding,
            top: AppConfig.defaultVerticalPadding),
        child: _buildFriendListView(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("친구"),
      titleTextStyle: Get.textTheme.headlineSmall,
      elevation: 5.0,
      backgroundColor: Get.theme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () =>
                Get.to(() => UserSearchPage(), binding: UserSearchBinding()),
            icon: const Icon(Icons.person_add_alt_outlined))
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
    //return Container();
    return Obx(() {
      if (controller.isFriendsLoaded == false) {
        return CircularProgressIndicator();
      } else {
        return ListView.separated(
          itemBuilder: ((context, index) =>
              FriendListItem(controller.friends[index])),
          itemCount: controller.friends.length,
          separatorBuilder: (context, index) => const Divider(),
        );
      }
    });
  }
}
