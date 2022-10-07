import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GalleryService extends GetxService {

  CollectionReference get col => FirebaseFirestore.instance.collection('gallery');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  
}