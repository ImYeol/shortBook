import 'package:short_book/data/model/user_model.dart';

class UserRepository {
  // singleton constructor
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  factory UserRepository() {
    return _instance;
  }

  //List<ShortBook> _shortBooks = null;
  Future<List<UserModel>> getFriends() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        UserModel('친구1', 'https://www.woolha.com/media/2020/03/eevee.png'),
        UserModel('친구2', 'https://www.woolha.com/media/2020/03/eevee.png'),
        UserModel('친구3', 'https://www.woolha.com/media/2020/03/eevee.png'),
        UserModel('친구4', 'https://www.woolha.com/media/2020/03/eevee.png'),
        UserModel('친구5', 'https://www.woolha.com/media/2020/03/eevee.png'),
      ],
    );
  }
}
