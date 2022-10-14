import 'package:get/get.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class UserSearchController extends GetxController {
  final _userService = Get.find<UserService>();
  final _searchResult = UserModel().obs;
  final _onSearching = false.obs;

  bool get onSearching => _onSearching.value;
  UserModel get searchResult => _searchResult.value;

  @override
  void onInit() {
    super.onInit();
    print("Init");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("Ready");
    //ever(_filterString, searchFriend);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("Close");
  }

  void getUser(String name) async {
    print("getUser : ${name}");
    //_onSearching.value = true;
    //_searchedBefore = true;
    _searchResult.value = await _userService.getUserByName(name);
    //_onSearching.value = false;
    print("getUser user: ${_searchResult}");
  }

  void addUserAsFriend(UserModel friend) async {
    await _userService.addFriend(friend);
    Get.back();
  }
}
