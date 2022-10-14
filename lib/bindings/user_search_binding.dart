import 'package:get/get.dart';
import 'package:short_book/controller/user_search_controller.dart';

class UserSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserSearchController());
  }
}
