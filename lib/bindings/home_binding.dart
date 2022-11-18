import 'package:get/get.dart';
import 'package:short_book/controller/book_gallery_controller.dart';
import 'package:short_book/controller/feed_controller.dart';
import 'package:short_book/controller/friend_controller.dart';
import 'package:short_book/controller/home_controller.dart';
import 'package:short_book/controller/writing_paper_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => BookGalleryController());
    Get.lazyPut(() => FeedController());
    Get.lazyPut(() => FriendController());
  }
}
