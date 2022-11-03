import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class FriendController extends GetxController {
  final _userService = Get.find<UserService>();
  List<UserModel> _friends = <UserModel>[];
  List<UserModel> get friends => _friends;
  final _isFriendsLoaded = false.obs;

  bool get isFriendsLoaded => _isFriendsLoaded.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    initialize();
  }

  Future<void> initialize() async {
    _friends.clear();
    _isFriendsLoaded.value = false;
    _friends = await Get.find<UserService>().getFriends();
    _isFriendsLoaded.value = true;
  }

  void onNewFriendAdded(UserModel friend) {
    if (friend.uid == '') return;

    _isFriendsLoaded.value = false;
    _friends.add(friend);
    _isFriendsLoaded.value = true;
  }

  void onFriendListItemTapped(UserModel friend) {
    Get.bottomSheet(
        Container(
          height: 150,
          child: Column(children: [
            ListTile(
                leading: Icon(
                  Icons.book_outlined,
                  color: Colors.white,
                ),
                title: Text("삼행시 요청"),
                onTap: () {
                  Get.back();
                  requestShortBookTo(friend);
                }),
            ListTile(
                leading: Icon(
                  Icons.block_outlined,
                  color: Colors.white,
                ),
                title: Text("친구 삭제"),
                onTap: () {
                  Get.back();
                  deleteFriend(friend);
                }),
          ]),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.black,
        isDismissible: true,
        ignoreSafeArea: false);
  }

  void requestShortBookTo(UserModel friend) {
    Get.toNamed(AppRoute.BOOK_SETTING, arguments: {'friend': friend});
  }

  void deleteFriend(UserModel friend) async {
    _isFriendsLoaded.value = false;
    await Get.find<UserService>().deleteFriend(friend);
    _friends.remove(friend);
    _isFriendsLoaded.value = true;
  }
}
