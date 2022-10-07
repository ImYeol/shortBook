import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  UserModel? currentUser;
  StreamSubscription? userDocumentSubscription;

  CollectionReference get col => FirebaseFirestore.instance.collection('users');
  DocumentReference get doc => col.doc(FirebaseAuth.instance.currentUser?.uid);
  String? get uid => FirebaseAuth.instance.currentUser?.uid;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //startService();
  }

  void startService() {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      print("authStateChanges called");
      if (firebaseUser == null) {
        print("startService - firebaseUser is null");
        unobserveUserDoc();
        Get.offAllNamed(AppRoute.LOGIN);
      } else {
        if (currentUser?.uid != firebaseUser.uid) {
          print("startService - currentUser is null");
          getUser(firebaseUser.uid).then((user) async {
            if (user.exists == false || user.createdAt == null) {
              // user doc 생성
              print("No user document exists");
              user.update({'createdAt': Timestamp.now()});
            }
          });
        }
        observeUserDoc();
        print("after observeUserDoc");
        Get.offAllNamed(AppRoute.HOME);
      }
    });
  }

  Map<String, UserModel> userDocumentContainer = {};
  Future<UserModel> getUser(
    String uid, {
    bool cache = true,
  }) async {
    final snapshot = await col.doc(uid).get();
    //userDocumentContainer[uid] = UserModel.fromSnapshot(snapshot);
    //return userDocumentContainer[uid]!;
    return UserModel.fromSnapshot(snapshot);
  }

  void observeUserDoc() {
    userDocumentSubscription?.cancel();
    userDocumentSubscription =
        doc.snapshots().listen((DocumentSnapshot snapshot) async {
      if (snapshot.exists == false) {
        // log('---> User document not exits in observeUserDoc.');
        print('---> User document not exits in observeUserDoc.');
      }
      currentUser = UserModel.fromSnapshot(snapshot);
      // log('----> observeUserDoc and update event with; $user');
      //userChange.add(user);
      print('----> observeUserDoc and update event with; $currentUser');
    });
  }

  /// 로그아웃을 할 때 호출되며, 사용자 모델(user)을 초기화하고, listening 해제하고, 이벤트를 날린다.
  void unobserveUserDoc() {
    userDocumentSubscription?.cancel();
    currentUser = UserModel();
    //userChange.add(user);
  }

  // 문서가 존재하지 않으면 생성을 한다.
  Future<void> update(Map<String, dynamic> data) {
    return doc.set({
      ...data,
      'updatedAt': Timestamp.now(),
    }, SetOptions(merge: true));
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
