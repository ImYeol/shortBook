import 'package:get/get.dart';
import 'package:short_book/controller/writing_book_controller.dart';

class WritingBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WritingBookController());
  }
}
