import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/book_studio.dart';
import 'package:short_book/data/model/user_model.dart';

// https://anangnugraha.medium.com/flutter-implementing-pagination-with-getx-state-management-6b824b1e1eb5
class WritingBookController extends GetxController {
  double _limitOfKeywordLength = 0;
  double _limitOfTimeToWrite = 0;
  String _title = '';
  List<UserModel> _participants = List.empty();

  WritingBookController();

  int get limitOfKeywordLength => _limitOfKeywordLength.toInt();
  int get limitOfTimeToWrite => _limitOfTimeToWrite.toInt();
  String get title => _title;
  List<UserModel> get participants => _participants;

  @override
  void onInit() {
    super.onInit();
  }

  void onKeywordLengthSelectionChanged(double length) {
    _limitOfKeywordLength = length;
    print("onKeywordLengthSelectionChanged = $_limitOfKeywordLength");
  }

  void onTimeToWriteChanged(double seconds) {
    _limitOfTimeToWrite = seconds;
    print("onTimeToWriteChanged = $_limitOfTimeToWrite");
  }

  void onTitleChanged(String title) {
    _title = title;
    print("onTitleChanged = $_title");
  }

  void onParticipantsChanged(List<UserModel> participants) {
    _participants = participants;
    print("onParticipantsChanged");
  }

  BookStudio buildBookStudio() {
    return BookStudio(_title, _participants, _limitOfKeywordLength.toInt(),
        _limitOfTimeToWrite.toInt());
  }
}
