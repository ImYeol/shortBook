import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/author.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class RelayBook extends ShortBook {
  Author fromAuthor;
  Author? targetAuthor;
  int keywordLength;
  int timeLimit;

  RelayBook(
      {required super.title,
      super.id,
      required this.fromAuthor,
      required this.targetAuthor,
      this.keywordLength = 0,
      this.timeLimit = 0,
      super.lines,
      super.updatedAt,
      super.createdAt});

  factory RelayBook.empty() {
    return RelayBook(
        title: '', fromAuthor: InvalidAuthor(), targetAuthor: InvalidAuthor());
  }

  factory RelayBook.fromSnapshot(DocumentSnapshot doc) {
    return ShortBook.fromSnapshot(doc, BookType.relay) as RelayBook;
  }

  factory RelayBook.fromJson(Map<String, dynamic> data, String id) {
    return ShortBook.fromJson(data, id, BookType.relay) as RelayBook;
  }

  @override
  CollectionReference<Object>? getCollection() {
    return targetAuthor == null
        ? null
        : Get.find<UserService>().col.doc(targetAuthor!.uid).collection('feed');
  }
}
