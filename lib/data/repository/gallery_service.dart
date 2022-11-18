import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/gallery_book.dart';
import 'package:short_book/data/model/short_book.dart';

class GalleryService extends GetxService {
  CollectionReference get galleryCol =>
      FirebaseFirestore.instance.collection('gallery');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<ShortBook>> getShortBooks(
      {String? uid, int limit = 20, List<Object>? startAfter}) async {
    Query q = galleryCol;
    if (uid != null) q = q.where('uid', isEqualTo: uid);

    //q = q.orderBy('like', descending: true);
    q = q.orderBy('createdAt', descending: true);

    // q = q.where('deleted', isEqualTo: false);
    // q = q.orderBy('like', descending: true);
    // q = q.orderBy('createdAt', descending: true);
    // q = q.limit(limit);

    if (startAfter != null) q = q.endBefore(startAfter);
    q = q.limit(limit);

    QuerySnapshot snapshot;
    try {
      snapshot = await q.get();
    } on FirebaseException catch (e) {
      print("${e.code}, ${e.message ?? ''}");
      rethrow;
    }

    List<ShortBook> shortBooks = [];
    snapshot.docs.forEach((doc) {
      shortBooks.add(GalleryBook.fromJson(
        doc.data() as Map<String, dynamic>,
        doc.id,
      ));
    });

    return shortBooks;
  }

  Future<ShortBook?> load(id) async {
    DocumentSnapshot doc = await galleryCol.doc(id).get();
    if (doc.exists == false) return null;
    return GalleryBook.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }
}
