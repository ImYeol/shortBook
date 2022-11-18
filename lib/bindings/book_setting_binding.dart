import 'package:get/get.dart';
import 'package:short_book/controller/book_setting_controller.dart';

class BookSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookSettingController());
  }
}
