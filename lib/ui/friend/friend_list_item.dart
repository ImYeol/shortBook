import 'package:flutter/material.dart';
import 'package:short_book/data/model/user_model.dart';

class FriendListItem extends StatelessWidget {
  final UserModel friend;
  const FriendListItem(this.friend, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 60.0,
        backgroundImage: NetworkImage(friend.imageUrl),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
