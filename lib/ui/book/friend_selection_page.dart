import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/book_studio_controller.dart';

// Only owner is allowed to commit book
class FriendSelectionPage extends GetView<BookStudioController> {
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppConfig.defaultVerticalPadding),
            child: Column(
                children: [_buildFriendsListView(), _buildKeywordView2()]),
          ),
        ),
      ),
    );
  }

  Widget _buildFriendsListView() {
    return Container(
        width: double.infinity,
        height: 100,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                      backgroundColor: Colors.red,
                    ),
                    Text(
                      "testasdf",
                      style: Get.textTheme.labelSmall,
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget _buildKeywordView() {
    return Row(
      children: [
        Text('낙\n동\n강', style: Get.textTheme.headlineMedium),
        const VerticalDivider(
          thickness: 10,
          color: Colors.white,
        ),
        Text(
          '낙ㅁㄴㅇㄹㄷㅁㄴㅇㄹㅁ\n동ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ\n강ㅁㄴㅇㄹㅁㄴㅈㄸㄸㄸㄸㄸㄷ\n',
          style: Get.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildKeywordView2() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('낙', style: Get.textTheme.headlineMedium),
          TextField(),
          Text('동', style: Get.textTheme.headlineMedium),
          TextField(),
          Text('강', style: Get.textTheme.headlineMedium),
          TextField(),
        ],
      ),
    );
  }
}
