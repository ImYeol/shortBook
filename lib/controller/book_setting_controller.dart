import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/model/author.dart';
import 'package:short_book/data/model/gallery_book.dart';
import 'package:short_book/data/model/line.dart';
import 'package:short_book/data/model/relay_book.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:short_book/data/repository/user_service.dart';

class BookSettingController extends GetxController {
  final _limitOfKeywordLength = AppConfig.defaultLimitOfKeywordLength.obs;
  final _limitOfTimeToWrite = 0.0.obs;
  final _title = ''.obs;
  final _participants = UserModel().obs;

  int get limitOfKeywordLength => _limitOfKeywordLength.value.toInt();
  int get limitOfTimeToWrite => _limitOfTimeToWrite.value.toInt();
  String get title => _title.value;
  UserModel get participants => _participants.value;

  @override
  void onInit() {
    super.onInit();
    print("WritingBookController onInit");
  }

  @override
  void onReady() {
    _participants.value = Get.arguments?['friend'] ?? UserModel();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
      Get.toNamed(AppRoute.BOOK_WRITING, arguments: {
        'relayBook': RelayBook(
            title: _title.value,
            lines: List.generate(_title.value.length,
                (index) => Line(author: InvalidAuthor(), content: '')),
            fromAuthor: Author.fromUserModel(
                Get.find<UserService>().currentUser ?? UserModel()),
            targetAuthor: _participants.value.uid == ''
                ? InvalidAuthor()
                : Author.fromUserModel(Get.find<UserService>().currentUser!),
            //: Author.fromUserModel(_participants.value),
            timeLimit: _limitOfTimeToWrite.value.toInt(),
            keywordLength: _limitOfKeywordLength.value.toInt())
      });
    } else {
      print("invalid settings");
    }
  }
}
