import 'package:short_book/data/model/user_model.dart';

class Author {
  final String uid;
  final String name;

  Author({this.uid = '', this.name = ''});

  factory Author.invalid() {
    return Author(uid: '', name: '');
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      uid: json["uid"],
      name: json["name"],
    );
  }

  factory Author.fromUserModel(UserModel user) {
    return Author(uid: user.uid, name: user.name);
  }

  Map<String, Object> toJson() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}

class InvalidAuthor extends Author {
  InvalidAuthor() : super();
}
