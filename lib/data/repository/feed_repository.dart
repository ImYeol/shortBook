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
      () => [
        ShortBook(
            title: "가나다",
            content: {"가": "가나다라마바사", '나': '나다라마바사', '다': '다라마바사'},
            writers: ['test1']),
        ShortBook(
            title: "낙동강",
            content: {"낙": "가나다라마바사", '동': '나다라마바사', '강': '다라마바사'},
            writers: ['test2']),
        ShortBook(
            title: "선풍기",
            content: {"선": "가나다라마바사", '풍': '나다라마바사', '기': '다라마바사'},
            writers: ['test3'])
      ],
    );
  }
}
