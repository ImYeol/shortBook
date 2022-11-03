import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/friend_selection_binding.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/controller/writing_book_controller.dart';
import 'package:short_book/ui/book/friend_selection_page.dart';
import 'package:short_book/ui/book/expansion_card_item.dart';
import 'package:short_book/ui/book/writing_paper_page.dart';
import 'package:short_book/widgets/min_max_showing_slider.dart';

class BookSettingPage extends GetView<WritingBookController> {
  BookSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.theme.backgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppConfig.defaultHorizonPadding),
          child: SingleChildScrollView(
            child: Obx(() => Column(children: [
                  _buildPageTitleTile(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildWritingTitleTile(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildParticipantsTile(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildWritingLengthLimitTile()
                  //_buildSendButton()
                ])),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: _buildSendButton(),
        ),
      ),
    );
  }

  Widget _buildPageTitleTile() {
    return Center(
      child: Text(
        '글쓰기',
        style: Get.textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildWritingTitleTile() {
    return ExpansionCardItem(
      title: "주제어",
      selectedItem: controller.title,
      children: [
        Text(
          "삼행시 주제를 입력해주세요.",
          style: Get.textTheme.labelSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: TextField(
            onChanged: controller.onTitleChanged,
          ),
        )
      ],
    );
  }

  Widget _buildParticipantsTile() {
    List<Widget> children = <Widget>[];
    children.add(
      ListTile(
          trailing: IconButton(
        icon: Icon(Icons.person_add_alt_rounded),
        onPressed: () {
          controller.searchFriendsAsParticipants();
        },
      )),
    );
    children.add(ListTile(title: Text(controller.participants.uid)));
    return ExpansionCardItem(
      title: "To",
      selectedItem: controller.participants.name != ''
          ? controller.participants.name
          : '모두에게',
      children: children,
    );
  }

  Widget _buildWritingLengthLimitTile() {
    return ExpansionCardItem(
      title: "길이제한",
      selectedItem: "${controller.limitOfKeywordLength}자",
      children: [
        MinMaxShowingSlider(controller.onKeywordLengthSelectionChanged,
            min: 3, max: 30)
      ],
    );
  }

  Widget _buildSendButton() {
    return Container(
        width: double.infinity,
        height: 50,
        color: Color.fromARGB(255, 94, 94, 94),
        child: TextButton(
          child: Text(
            '글쓰기',
            style: Get.textTheme.bodyLarge,
          ),
          onPressed: () => controller.onSubmitButtonPressed(),
        ));
  }
}
