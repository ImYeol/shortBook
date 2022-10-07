import 'package:short_book/data/model/short_book.dart';

class ShortBookRepositoroy {
  // singleton constructor
  ShortBookRepositoroy._privateConstructor();
  static final ShortBookRepositoroy _instance =
      ShortBookRepositoroy._privateConstructor();
  factory ShortBookRepositoroy() {
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
