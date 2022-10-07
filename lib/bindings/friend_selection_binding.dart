import 'package:get/get.dart';
import 'package:short_book/controller/friend_controller.dart';

class FriendSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FriendController());
  }
}
