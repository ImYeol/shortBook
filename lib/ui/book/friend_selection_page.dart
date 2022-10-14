import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/friend_controller.dart';

// Only owner is allowed to commit book
class FriendSelectionPage extends GetView<FriendController> {
  const FriendSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConfig.defaultVerticalPadding),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPageTitleTile(),
                const SizedBox(
                  height: 20,
                ),
                _buildSearchBar(),
                const SizedBox(
                  height: 10,
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildPageTitleTile() {
    return Center(
      child: Text(
        '친구 검색',
        style: Get.textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "친구 아이디 입력",
        hintStyle: Get.textTheme.labelMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 94, 94, 94),
        suffixIcon: IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () => {},
        ),
        iconColor: Colors.white,
      ),
      onChanged: (filter) => {},
    );
  }

  Widget _buildFriendsListView() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 0,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: InkWell(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/eevee.png'),
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  '',
                  style: Get.textTheme.labelSmall,
                ),
              ),
              onTap: () => Get.back(),
            ),
          );
        },
      ),
    );
  }
}
