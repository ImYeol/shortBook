import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:short_book/data/model/relay_book.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:get/get.dart';
import 'package:short_book/data/repository/user_service.dart';

class FeedService extends GetxService {
  CollectionReference get feedCol =>
      Get.find<UserService>().doc.collection('feed');

  StreamSubscription? feedCollectionSubscription;

  RxList<RelayBook> feedMessages = <RelayBook>[].obs;

  @override
  void onClose() {
    // TODO: implement onClose
    print("FeedService onClose");
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("FeedService onReady");
    super.onReady();
  }

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      print("authStateChanges called");
      if (firebaseUser == null) {
        unobserveFeedDoc();
      } else {
        observeFeedDoc();
      }
    });
  }

  observeFeedDoc() {
    print("observeFeedDoc");
    feedCollectionSubscription?.cancel();
    feedCollectionSubscription = feedCol.snapshots().listen(
      (querySnapshot) {
        List<RelayBook> messages = <RelayBook>[];
        querySnapshot.docs.forEach((doc) {
          RelayBook challenge =
              RelayBook.fromJson(doc.data() as Map<String, dynamic>, doc.id);
          messages.add(challenge);
        });
        feedMessages.value = messages;
        // querySnapshot.docChanges.forEach((documentChange) {
        //   if (documentChange.type == DocumentChangeType.added) {
        //     print("added");
        //     Challenge.fromSnapshot(documentChange.doc);
        //   } else if (documentChange.type == DocumentChangeType.removed) {
        //     print("removed");
        //   } else if (documentChange.type == DocumentChangeType.modified) {
        //     print("modified");
        //   }
        // });
      },
    );
  }

  /// 로그아웃을 할 때 호출되며, 사용자 모델(user)을 초기화하고, listening 해제하고, 이벤트를 날린다.
  unobserveFeedDoc() async {
    print("unobserveFeedDoc");
    feedCollectionSubscription?.cancel();
  }

  Future<List<RelayBook>> getRequests(
      {int limit = 20, List<Object>? startAfter}) async {
    Query q = feedCol;

    q = q.orderBy('createdAt', descending: true);
    if (startAfter != null) q = q.endBefore(startAfter);
    q = q.limit(limit);

    QuerySnapshot snapshot;
    try {
      snapshot = await q.get();
    } on FirebaseException catch (e) {
      print("${e.code}, ${e.message ?? ''}");
      rethrow;
    }

    List<RelayBook> challenges = [];
    snapshot.docs.forEach((doc) {
      challenges.add(RelayBook.fromJson(
        doc.data() as Map<String, dynamic>,
        doc.id,
      ));
    });

    return challenges;
  }
}
