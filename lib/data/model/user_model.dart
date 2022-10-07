import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:short_book/data/repository/user_service.dart';
import 'package:get/get.dart';

class UserModel {
  String uid = '';
  String email = '';
  String imageUrl = '';
  // users/uid 문서가 존재하는지
  bool? exists;
  Timestamp? updatedAt;
  Timestamp? createdAt;
  List<String> friends = <String>[];

  UserModel();

  Future<void> update(Map<String, dynamic> data) {
    return Get.find<UserService>().update(data);
  }

  void setProperties(dynamic data, String uid) {
    this.uid = uid;
    print("setProperties : uid(${this.uid}");
    if (data == null) return;

    /// FirebaseAuth.email 에 메일 주소가 있으면 그것을 먼저 사용하고, 없으면 사용자 문서의 email 주소를 사용한다.
    email = (FirebaseAuth.instance.currentUser?.email ?? '') == ''
        ? (data['email'] ?? '')
        : FirebaseAuth.instance.currentUser?.email;

    /// Some timestamp data (like date from Typesense) is int.
    createdAt = data['createdAt'] is int
        ? Timestamp(data['createdAt'], 0)
        : data['createdAt'];
    updatedAt = data['updatedAt'] is int
        ? Timestamp(data['updatedAt'], 0)
        : data['updatedAt'];
    print("createdAt = $createdAt, updatedAt = $updatedAt");
    //friends = List.from(data[])
    print("friends : ${data['friends']}");
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    exists = snapshot.exists;
    setProperties(snapshot.data(), snapshot.id);
  }
}
