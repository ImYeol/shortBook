import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/writing_book_binding.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/ui/book/book_gallery_page.dart';
import 'package:short_book/ui/book/book_setting_page.dart';
import 'package:short_book/ui/feed/feed_page.dart';
import 'package:short_book/ui/friend/friend_page.dart';
import 'package:short_book/ui/profile/profile_page.dart';

class HomeController extends GetxController {
  final _currentIndex = 0.obs;
  final _pageController = PageController(keepPage: true);

  final List<String> _pageTitles = ['갤러리', '친구', '알림', '내정보'];

  final List<IconData> _pageIconData = [
    Icons.library_books,
    Icons.people,
    Icons.message_outlined,
    Icons.person
  ];

  final List<Widget> _pages = [
    BookGalleryPage(),
    FriendPage(),
    FeedPage(),
    ProfilePage()
  ];

  int get pageIndex => _currentIndex.value;
  List<Widget> get pages => _pages;
  List<String> get pageTitles => _pageTitles;
  List<IconData> get pageIcons => _pageIconData;
  PageController get pageController => _pageController;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _currentIndex.value = 0;
  }

  void changePage(int index) {
    _currentIndex.value = index;
    pageController.jumpToPage(index);
    print("changePage - $index");
  }

  bool isSelected(int index) {
    return _currentIndex.value == index;
  }

  void prepareWritingPaper() {
    // Get.to(() => WritingBookPage(),
    //     binding: WritingBookBinding(),
    //     transition: Transition.topLevel,
    //     duration: const Duration(milliseconds: 500));
    Get.toNamed(
      AppRoute.BOOK_SETTING,
    );
  }
}
