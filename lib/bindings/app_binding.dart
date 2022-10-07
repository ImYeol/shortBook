import 'package:get/get.dart';
import 'package:short_book/data/repository/user_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    print("AppBinding called");
    Get.lazyPut(() => UserService());
  }
}
