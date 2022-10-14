import 'package:get/get.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class FriendController extends GetxController {
  final _userService = Get.find<UserService>();
  List<UserModel> _friends = <UserModel>[];
  final _searchedFriend = <UserModel>[].obs;
  List<UserModel> get friends => _friends;
  final _isFriendsLoaded = false.obs;

  bool get isFriendsLoaded => _isFriendsLoaded.value;

  Future<void> initialize() async {
    _isFriendsLoaded.value = false;
    _friends.clear();
    _friends = await Get.find<UserService>().getFriends();
    _isFriendsLoaded.value = true;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    initialize();
    //ever(_filterString, searchFriend);
  }

  void searchFriend(String? id) {
    if (id == null) {
      _searchedFriend.value.addAll(_friends);
    } else {
      _searchedFriend.value =
          _friends.where((user) => user.uid.contains(id)).toList();
    }
    print("search friend = $id");
  }
}
