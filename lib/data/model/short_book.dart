import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:short_book/data/repository/user_service.dart';

class ShortBook {
  String id;
  String uid;
  String userName;
  String title;
  List<String> content;
  int like;
  int numOfComments;
  bool deleted;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  ShortBook(
      {this.id = '',
      this.uid = '',
      this.userName = '',
      this.title = '',
      this.content = const <String>[],
      this.like = 0,
      this.numOfComments = 0,
      this.deleted = false,
      this.createdAt,
      this.updatedAt});

  CollectionReference get galleryCol =>
      FirebaseFirestore.instance.collection('gallery');

  factory ShortBook.fromSnapshot(DocumentSnapshot doc) {
    return ShortBook.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  factory ShortBook.fromJson(Map<String, dynamic> data, String id) {
    List<String> content =
        List<String>.from(data['content'] ?? const <String>[]);

    /// In old data format, [createdAt] and [updatedAt] are int of unix timestamp.
    /// Convert those into Firestore timestamp.
    Timestamp? _createdAt = data['createdAt'] is int
        ? Timestamp.fromMillisecondsSinceEpoch(data['createdAt'] * 1000)
        : data['createdAt'];

    Timestamp? _updatedAt = data['updatedAt'] is int
        ? Timestamp.fromMillisecondsSinceEpoch(data['updatedAt'] * 1000)
        : data['updatedAt'];

    final shortBook = ShortBook(
      id: id,
      title: data['title'] ?? '',
      content: content,
      numOfComments: data['noOfComments'] ?? 0,
      deleted: data['deleted'] ?? false,
      uid: data['uid'] ?? '',
      like: data['like'] ?? 0,
      createdAt: _createdAt,
      updatedAt: _updatedAt,
    );

    /// If the post is opened, then maintain the status.
    /// If the [open] property is not maintained,
    /// every time the document had updated, `ShortBook.fromJson` will be called again
    /// and [open] becomes false, and the post may be closed.
    /// For instance, when user likes the post and the post closes on post list.
    // if (PostService.instance.posts[post.id] != null) {
    //   final p = PostService.instance.posts[post.id]!;
    //   post.open = p.open;
    // }

    /// Keep loaded post into memory.
    // PostService.instance.posts[post.id] = post;

    return shortBook;
  }

  Future<ShortBook> create({
    required String title,
    required List<String> content,
    String? documentId,
    Map<String, dynamic> extra = const {},
  }) async {
    //if (signedIn == false) throw ERROR_SIGN_IN_FIRST_FOR_POST_CREATE;
    print("create : ${content}");
    final data = {
      'title': title,
      'content': content,
      'userName': userName,
      'uid': Get.find<UserService>().uid,
      'deleted': false,
      'like': 0,
      'noOfComments': 0,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      ...extra,
    };

    DocumentReference<Object?> res;
    if (documentId != null && documentId != '') {
      await galleryCol.doc(documentId).set(data);
      res = galleryCol.doc(documentId);
    } else {
      res = await galleryCol.add(data);
    }

    return ShortBook.fromSnapshot(await res.get());
  }

  /// Update a post.
  ///
  /// It returns [ShortBook] of newly create post.
  Future<ShortBook> update({
    required String title,
    required String content,
    Map<String, dynamic> extra = const {},
  }) async {
    // if (deleted) throw ERROR_ALREADY_DELETED;
    // if (id.isEmpty) throw ERROR_POST_ID_IS_EMPTY_FOR_UPDATE;
    // if (uid != UserService.instance.uid) throw ERROR_NOT_YOUR_POST;

    await galleryCol.doc(id).update({
      'title': title,
      'content': content,
      'updatedAt': FieldValue.serverTimestamp(),
      ...extra
    });
    return ShortBook.fromSnapshot(await galleryCol.doc(id).get());
  }

  Future<ShortBook> get(String galleryId) async {
    final snapshot = await galleryCol.doc(galleryId).get();
    return ShortBook.fromJson(
        snapshot.data() as Map<String, dynamic>, snapshot.id);
  }

  /// See readme.
  Future<void> delete() async {
    if (id.isEmpty) throw 'Gallery id empty on delete';

    // if (noOfComments < 1) {
    return galleryCol.doc(id).delete();
    // } else {
    //   return postDoc(id).update({
    //     'deleted': true,
    //     'updatedAt': FieldValue.serverTimestamp(),
    //   });
    // }
  }
}
