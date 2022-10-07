import 'package:get/get.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class FriendController extends GetxController {
  List<UserModel> _friends = <UserModel>[];
  final _searchedFriend = <UserModel>[].obs;
  final _filterString = "".obs;
  final loaded = false.obs;

  List<UserModel> get searchedFriends => _searchedFriend.value;
  set filterString(String filter) {
    _filterString.value = filter;
  }

  Future<void> initialize() async {
    loaded.value = false;
    final friends = Get.find<UserService>().currentUser?.friends;
    if (_friends.length > 0) {
      _filterString.value = "";
    }
    loaded.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
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
