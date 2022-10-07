import 'package:short_book/data/model/short_book.dart';

class FeedRepository {
  // singleton constructor
  FeedRepository._privateConstructor();
  static final FeedRepository _instance = FeedRepository._privateConstructor();
  factory FeedRepository() {
    return _instance;
  }

  //List<ShortBook> _shortBooks = null;
  Future<List<ShortBook>> fetchShortBookList(int count) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [ShortBook(), ShortBook(), ShortBook()],
    );
  }
}
