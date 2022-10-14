import 'package:flutter/material.dart';
import 'package:short_book/controller/user_search_controller.dart';
import 'package:short_book/data/model/user_model.dart';
import 'package:get/get.dart';

class UserSearchResult extends StatelessWidget {
  final UserModel _user;
  final emptyIcon = const Icon(
    Icons.person,
    color: Colors.black,
    size: 50,
  );
  const UserSearchResult(this._user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            _user.name.isEmpty ? _buildNoResultWidget() : _buildResultWidget());
  }

  Widget _buildNoResultWidget() {
    return Text("검색 결과 없음", style: Get.textTheme.bodyLarge);
  }

  Widget _buildResultWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //_user.imageUrl.isEmpty? emptyIcon :
        emptyIcon,
        Text(
          _user.name,
          style: Get.textTheme.labelMedium,
        ),
        ElevatedButton(
            onPressed: () =>
                Get.find<UserSearchController>().addUserAsFriend(_user),
            child: Container(
              child: Text("추가", style: Get.textTheme.labelMedium),
            ))
      ],
    );
  }
}
