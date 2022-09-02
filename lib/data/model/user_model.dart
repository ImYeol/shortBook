import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String imageUrl;

  Timestamp? updatedAt;
  Timestamp? createdAt;

  UserModel(this.uid, this.imageUrl);
}
