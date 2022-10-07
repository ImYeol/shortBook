import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/book_studio.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:short_book/data/model/user_model.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
class WritingBookController extends GetxController {
  final _limitOfKeywordLength = AppConfig.defaultLimitOfKeywordLength.obs;
  final _limitOfTimeToWrite = 0.0.obs;
  final _title = ''.obs;
  final _participants = <UserModel>[].obs;
  List<TextEditingController>? inputControllers;

  WritingBookController();

  int get limitOfKeywordLength => _limitOfKeywordLength.value.toInt();
  int get limitOfTimeToWrite => _limitOfTimeToWrite.value.toInt();
  String get title => _title.value;
  List<UserModel> get participants => _participants.value;

  @override
  void onInit() {
    super.onInit();
    print("WritingBookController onInit");
    // if (title.isNotEmpty) {
    //   inputControllers =
    //       List.generate(title.length, (index) => TextEditingController());
    // }
  }

  @override
  void onClose() {
    super.onClose();
    print("WritingBookController onClose");
    inputControllers?.clear();
  }

  void onKeywordLengthSelectionChanged(double length) {
    _limitOfKeywordLength.value = length;
    print("onKeywordLengthSelectionChanged = $_limitOfKeywordLength");
  }

  void onTimeToWriteChanged(double seconds) {
    _limitOfTimeToWrite.value = seconds;
    print("onTimeToWriteChanged = $_limitOfTimeToWrite");
  }

  void onTitleChanged(String title) {
    _title.value = title;
    print("onTitleChanged = $_title");
  }

  void searchFriendsAsParticipants() async {
    print("search friends result1");
    final friends = await Get.toNamed(AppRoute.SEARCH_FRIEND);
    if (friends != null) {
      _participants.value = friends;
    }
    print("search friends result2 ${friends}");
  }

  bool isValidSettings() {
    return (title.isNotEmpty && limitOfKeywordLength > 0);
  }

  void onSubmitButtonPressed() {
    if (isValidSettings()) {
      inputControllers =
          List.generate(title.length, (index) => TextEditingController());
      Get.toNamed(AppRoute.BOOK_WRITING);
    } else {
      print("invalid settings");
    }
  }

  // TODO: store book to firestore
  void onUploadButtonPressed() async {
    if (inputControllers == null) {
      Get.snackbar("ERROR", "please write something");
      return;
    }
    final shortBook = await ShortBook().create(
        title: title,
        content:
            inputControllers!.map((controller) => controller.text).toList());
    Get.until((route) => Get.currentRoute == AppRoute.HOME);
  }
}
