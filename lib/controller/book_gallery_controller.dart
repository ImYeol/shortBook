import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:short_book/data/repository/gallery_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
// https://www.raywenderlich.com/14214369-infinite-scrolling-pagination-in-flutter
// https://www.freecodecamp.org/news/infinite-pagination-in-flutter-with-riverpod/
class BookGalleryController extends GetxController {
  final galleryService = Get.find<GalleryService>();
  final _pageController = PageController(keepPage: true);
  final _shortBooks = <ShortBook>[].obs;
  bool noMoreDataExist = false;

  List<ShortBook> get shortBooks => _shortBooks;
  PageController get pageController => _pageController;

  @override
  void onInit() {
    print("onInit");
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("onReady");
    noMoreDataExist = false;
    fetchBooks();
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose");
    _pageController.dispose();
    super.onClose();
  }

  Future<void> onRefresh() async {
    _shortBooks.clear();
    Future.delayed(
      Duration(seconds: 1),
      () => fetchBooks(),
    );
  }

  void onShareButtonClicked() {}

  void onCommentButtonClicked() {}

  void onLikeButtonClicked() {}

  void checkFetchable(int index) {
    print("index = $index, len = ${_shortBooks.length}");
    if ((index >= (_shortBooks.length * 0.6) && noMoreDataExist == false)) {
      fetchBooks();
    }
  }

  void fetchBooks() async {
    print("fetch started");
    final newItems = _shortBooks.isNotEmpty
        ? await galleryService.getShortBooks(
            startAfter: [_shortBooks.first.createdAt ?? Timestamp.now()])
        : await galleryService.getShortBooks();
    if (_shortBooks.isNotEmpty) {
      print("first element : ${_shortBooks.first}");
    }
    if (newItems.isEmpty) {
      print("newItem is empty");
      noMoreDataExist = true;
    }
    print("newItems size = ${newItems.length}");
    _shortBooks.addAll(newItems);
  }
}
