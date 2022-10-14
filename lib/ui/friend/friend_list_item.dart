import 'package:flutter/material.dart';
import 'package:short_book/data/model/user_model.dart';

class FriendListItem extends StatelessWidget {
  final UserModel friend;
  const FriendListItem(this.friend, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        color: Colors.white,
        size: 50,
      ),
      title: Text(
        friend.name,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
