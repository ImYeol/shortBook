import 'package:get/get.dart';
import 'package:short_book/controller/book_studio_controller.dart';

class FriendSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookStudioController());
  }
}
