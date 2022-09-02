import 'package:short_book/data/model/user_model.dart';

class BookStudio {
  final String _title;
  final List<UserModel> _participants;
  final int _limitOfKeywordLength;
  final int _limitOfTimeToWrite;

  const BookStudio(this._title, this._participants, this._limitOfKeywordLength,
      this._limitOfTimeToWrite);

  String get title => _title;
  List<UserModel> get participants => _participants;
  int get limitOfKeywordLength => _limitOfKeywordLength;
  int get limitOfTimeToWrite => _limitOfTimeToWrite;
}
