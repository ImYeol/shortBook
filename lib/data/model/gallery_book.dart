import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:short_book/data/model/short_book.dart';

class GalleryBook extends ShortBook {
  int like;
  int numOfComments;
  bool deleted;

  GalleryBook(
      {required super.title,
      super.id,
      super.lines,
      this.numOfComments = 0,
      this.deleted = false,
      this.like = 0,
      super.createdAt,
      super.updatedAt});

  factory GalleryBook.fromSnapshot(DocumentSnapshot doc) {
    return ShortBook.fromSnapshot(doc, BookType.gallery) as GalleryBook;
  }

  factory GalleryBook.fromJson(Map<String, dynamic> data, String id) {
    return ShortBook.fromJson(data, id, BookType.gallery) as GalleryBook;
  }

  @override
  CollectionReference<Object>? getCollection() {
    return FirebaseFirestore.instance.collection('gallery');
  }

  @override
  void create({String? documentId, Map<String, dynamic> extra = const {}}) {
    super.create(documentId: documentId, extra: {
      'like': like,
      'numOfComments': numOfComments,
      'deleted': deleted
    });
  }

  @override
  void update({Map<String, dynamic> extra = const {}}) {
    super.update(extra: {
      'like': like,
      'numOfComments': numOfComments,
      'deleted': deleted
    });
  }
}
