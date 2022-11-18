import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/author.dart';
import 'package:short_book/data/model/gallery_book.dart';
import 'package:short_book/data/model/line.dart';
import 'package:short_book/data/model/relay_book.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
class WritingPaperController extends GetxController {
  late RelayBook bookSetting = RelayBook.empty();
  late List<TextEditingController> inputControllers;

  int get limitOfKeywordLength => bookSetting.keywordLength;
  int get limitOfTimeToWrite => bookSetting.timeLimit;
  String get title => bookSetting.title.isEmpty ? '무제' : bookSetting.title;

  @override
  void onInit() {
    setArguments();
    inputControllers = List.generate(
        bookSetting.title.length,
        (index) => TextEditingController(
            text: index < bookSetting.lines.length
                ? bookSetting.lines[index].content
                : ''));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void setArguments() {
    bookSetting = Get.arguments?['relayBook'] ?? RelayBook.empty();

    if (bookSetting.title.isEmpty) {
      print("title is null");
      Get.back();
    }
  }

  void updateLines() {
    final currentUser = Get.find<UserService>().currentUser;
    for (int i = 0; i < bookSetting.title.length; i++) {
      bookSetting.lines[i] = Line(
          author: Author.fromUserModel(currentUser!),
          content: inputControllers[i].text);
    }
  }

  void uploadForGallery() {
    GalleryBook(title: bookSetting.title, lines: bookSetting.lines).create();
  }

  void uploadForChallenge() {
    UserModel? user = Get.find<UserService>().currentUser;
    if (user == null) {
      print("current user is null");
      return;
    }
    print("from - ${user}, to - ${user}");
    bookSetting.create();
  }

  bool isAllFilled() {
    bool filled = false;
    bookSetting.lines.map((line) => filled = line.content.isNotEmpty);
    return filled;
  }

  void onUploadButtonPressed() {
    updateLines();
    if (bookSetting.targetAuthor is InvalidAuthor) {
      print("upload gallery");
      // gallery upload
      if (isAllFilled()) {
        Get.snackbar("ERROR", "빈칸이 있습니다.");
        return;
      }
      uploadForGallery();
    } else {
      print("upload relay");
      // relay challenge
      uploadForChallenge();
    }
    Get.until((route) => Get.currentRoute == AppRoute.HOME);
  }
}
