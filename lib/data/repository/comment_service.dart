import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommentService extends GetxService {
  CollectionReference get galleryCol =>
      FirebaseFirestore.instance.collection('comment');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
