import 'package:get/get.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_repository.dart';

class FriendController extends GetxController {
  final _repository = UserRepository();
  final _friends = List<UserModel>.empty().obs;

  List<UserModel> get friends => _friends.value;

  //List<UserInfo> get friends => _repository.fetchFriends().then((value) => null);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _repository.getFriends().then((friends) => _friends.value = friends);
  }

  void searchFriend(String id) {
    print("search friend = $id");
  }
}
