import 'package:short_book/data/model/book_studio.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
class BookStudioController extends GetxController {
  late BookStudio _bookStudio;

  String get title => _bookStudio.title;
  List<UserModel> get participants => _bookStudio.participants;
  int get limitOfKeywordLength => _bookStudio.limitOfKeywordLength;
  int get limitOfTimeToWrite => _bookStudio.limitOfTimeToWrite;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _bookStudio = Get.arguments['book_params'];
  }
}
