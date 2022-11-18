import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/author.dart';
import 'package:short_book/data/model/gallery_book.dart';
import 'package:short_book/data/model/line.dart';
import 'package:short_book/data/model/relay_book.dart';
import 'package:short_book/data/repository/user_service.dart';

enum BookType { gallery, relay }

abstract class ShortBook {
  String id;
  String title;
  List<Line> lines;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  ShortBook(
      {this.id = '',
      required this.title,
      this.lines = const <Line>[],
      this.createdAt,
      this.updatedAt});

  CollectionReference<Object>? getCollection();

  factory ShortBook.fromSnapshot(DocumentSnapshot doc, BookType type) {
    return ShortBook.fromJson(doc.data() as Map<String, dynamic>, doc.id, type);
  }

  factory ShortBook.fromJson(
      Map<String, dynamic> data, String id, BookType type) {
    List<Line> tempLines = List<dynamic>.from(data['lines'] ?? <List>[])
        .map((item) => Line.fromJson(item))
        .toList();

    Timestamp? tempCreatedAt = data['createdAt'] is int
        ? Timestamp.fromMillisecondsSinceEpoch(data['createdAt'] * 1000)
        : data['createdAt'];

    Timestamp? tempUpdatedAt = data['updatedAt'] is int
        ? Timestamp.fromMillisecondsSinceEpoch(data['updatedAt'] * 1000)
        : data['updatedAt'];

    switch (type) {
      case BookType.gallery:
        final shortBook = GalleryBook(
          id: id,
          title: data['title'] ?? '',
          lines: tempLines,
          numOfComments: data['noOfComments'] ?? 0,
          deleted: data['deleted'] ?? false,
          like: data['like'] ?? 0,
          createdAt: tempCreatedAt,
          updatedAt: tempUpdatedAt,
        );
        return shortBook;
      case BookType.relay:
        final shortBook = RelayBook(
          id: id,
          title: data['title'] ?? '',
          fromAuthor: Author.invalid(),
          targetAuthor: Author.invalid(),
          lines: tempLines,
          keywordLength: data['keywordLength'] ?? 0,
          timeLimit: data['timeLimit'] ?? 0,
          createdAt: tempCreatedAt,
          updatedAt: tempUpdatedAt,
        );
        return shortBook;
      default:
        return GalleryBook(title: "");
    }
  }

  void create({
    String? documentId,
    Map<String, dynamic> extra = const {},
  }) async {
    if (lines == null || lines!.isEmpty) {
      print("skip create : $lines");
      return;
    }
    final data = {
      'title': title,
      'lines': lines.map((line) => line.toJson()).toList(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      ...extra,
    };

    if (documentId != null && documentId.isEmpty) {
      await getCollection()?.doc(documentId).set(data);
    } else {
      await getCollection()?.add(data);
    }
  }

  /// Update a post.
  void update({
    Map<String, dynamic> extra = const {},
  }) async {
    if (lines == null || lines!.isEmpty) {
      print("skip create : $lines");
      return;
    }
    await getCollection()?.doc(id).update({
      'title': title,
      'lines': lines,
      'updatedAt': FieldValue.serverTimestamp(),
      ...extra
    });
  }

  /// See readme.
  Future<void> delete() async {
    if (id.isEmpty) throw 'Gallery id empty on delete';

    // if (noOfComments < 1) {
    return getCollection()?.doc(id).delete();
    // } else {
    //   return postDoc(id).update({
    //     'deleted': true,
    //     'updatedAt': FieldValue.serverTimestamp(),
    //   });
    // }
  }
}
