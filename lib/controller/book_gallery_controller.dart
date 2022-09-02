import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:short_book/data/repository/short_book_repository.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
class BookGalleryController extends GetxController {
  final int _preloadCount = 3;
  final double _preloadThreshold = 0.6;

  final _repository = ShortBookRepositoroy();
  final _shortBooks = <ShortBook>[].obs;

  BookGalleryController();

  List<ShortBook> get books => _shortBooks.toList();

  @override
  void onInit() {
    _getAllBooks();
    super.onInit();
  }

  Future<void> _getAllBooks() async {
    final newbooks = await _repository.fetchShortBookList(_preloadCount);
    if (newbooks.isNotEmpty) {
      _shortBooks.addAll(newbooks);
    }
  }

  bool needToPreload(int index) {
    return ((index / _shortBooks.length) >= _preloadThreshold);
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    if (needToPreload(index)) {
      _getAllBooks();
    }
  }
}
