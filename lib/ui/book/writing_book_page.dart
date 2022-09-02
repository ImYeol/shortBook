import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/book_studio_binding.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/writing_book_controller.dart';
import 'package:short_book/ui/book/friend_selection_page.dart';
import 'package:short_book/ui/book/expansion_card_item.dart';
import 'package:short_book/ui/book/writing_paper_page.dart';
import 'package:short_book/widgets/min_max_showing_slider.dart';

class WritingBookPage extends GetView<WritingBookController> {
  WritingBookPage({Key? key}) : super(key: key);

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
            child: Column(children: [
              _buildPageTitleTile(),
              SizedBox(
                height: 20,
              ),
              _buildWritingTitleTile(),
              SizedBox(
                height: 10,
              ),
              _buildWritingTypeTile(),
              SizedBox(
                height: 10,
              ),
              //_buildSendButton()
            ]),
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

  // Widget _buildParticipantsListView() {
  //   return Container(
  //     height: 100,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 3,
  //       itemBuilder: (context, index) {
  //         return Container(
  //           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
  //           child: Column(
  //             children: [
  //               CircleAvatar(
  //                 backgroundImage: NetworkImage(
  //                     'https://www.woolha.com/media/2020/03/eevee.png'),
  //                 backgroundColor: Colors.red,
  //               ),
  //               Text(
  //                 "testasdf",
  //                 style: Get.textTheme.labelSmall,
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget _buildWritingTypeTile() {
    return ExpansionCardItem(
      title: "유형",
      children: [
        TextField(
          onChanged: controller.onTitleChanged,
        )
      ],
    );
  }

  Widget _buildWritingLengthLimitTile() {
    return ExpansionCardItem(
      title: "유형",
      children: [
        TextField(
          onChanged: controller.onTitleChanged,
        ),
        MinMaxShowingSlider(controller.onTimeToWriteChanged, min: 0, max: 30)
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
            '시작',
            style: Get.textTheme.bodyLarge,
          ),
          onPressed: () => Get.to(() => const WritingPaperPage(),
              transition: Transition.rightToLeft),
        ));
  }
}
