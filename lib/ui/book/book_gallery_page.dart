import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/book_gallery_controller.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/short_book.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:short_book/widgets/keep_alive_wrapper.dart';

class BookGalleryPage extends GetView<BookGalleryController> {
  BookGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Obx(() {
        print("changed");
        if (controller.shortBooks.isEmpty) {
          return Center(
            child: Container(
              width: 20,
              height: 20,
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          );
        } else {
          return KeepAliveWrapper(child: _buildGalleryView());
        }
      }),
    );
  }

  Widget _buildGalleryView() {
    return RefreshIndicator(
        child: PageView.builder(
          itemBuilder: (context, index) =>
              _buildBookItem(controller.shortBooks[index]),
          scrollDirection: Axis.vertical,
          onPageChanged: ((index) => controller.checkFetchable(index)),
          itemCount: controller.shortBooks.length,
          controller: controller.pageController,
        ),
        onRefresh: () => controller.onRefresh());
  }

  Widget _buildBookItem(ShortBook bookItem) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              _buildTitleView(bookItem.title, bookItem.userName),
              _buildContentView(bookItem.title, bookItem.content),
            ],
          ),
          Positioned(
            child: _buildFunctionButtons(bookItem),
            right: 10,
            bottom: 20,
          )
        ],
      ),
    );
  }

  Widget _buildTitleView(String title, String writers) {
    return Container(
        height: 100,
        width: Get.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Get.textTheme.headlineLarge,
            ),
            Text(
              "by $writers",
              style: Get.textTheme.bodyMedium,
            )
          ],
        ));
    // return Row(
    //   children: [
    //     Text(
    //       title,
    //       style: Get.textTheme.displaySmall,
    //     )
    //   ],
    // );
  }

  Widget _buildLineView(String firstCh, String line) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppConfig.defaultVerticalPadding,
          horizontal: AppConfig.defaultHorizonPadding),
      child: Row(
        children: [
          Text(
            firstCh,
            style: Get.textTheme.headlineLarge,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            line,
            style: Get.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildContentView(String title, List<String> content) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            _buildLineView(title[index], content[index]),
        itemCount: content.length,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildFunctionButton(
      IconData icon, String title, Function() onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          title,
          style: Get.textTheme.labelSmall,
        )
      ],
    );
  }

  Widget _buildFunctionButtons(ShortBook shortBook) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildFunctionButton(
            Icons.share, "공유", controller.onShareButtonClicked),
        _buildFunctionButton(
            Icons.comment_outlined,
            shortBook.numOfComments.toString(),
            controller.onCommentButtonClicked),
        _buildFunctionButton(Icons.thumb_up_alt_outlined,
            shortBook.like.toString(), controller.onLikeButtonClicked),
      ],
    );
  }
}
