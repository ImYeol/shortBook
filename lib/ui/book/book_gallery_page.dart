import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:short_book/controller/book_gallery_controller.dart';
import 'package:get/get.dart';
import 'package:short_book/data/model/short_book.dart';

class BookGalleryPage extends GetView<BookGalleryController> {
  BookGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("gallery");
    // return Container(
    //   width: double.infinity,
    //   height: double.infinity,
    //   child: CarouselSlider(
    //     options: CarouselOptions(
    //         height: double.infinity,
    //         viewportFraction: 1.0,
    //         enlargeCenterPage: false,
    //         autoPlay: false,
    //         enableInfiniteScroll: true,
    //         onPageChanged: (index, reason) =>
    //             controller.onPageChanged(index, reason)),
    //     items: _buildBookWidgets(controller.books),
    //   ),
    // );
  }

  List<Widget> _buildBookWidgets(List<ShortBook> books) {
    List<Widget> bookWidgets = List.empty();
    for (ShortBook book in books) {
      bookWidgets.add(_buildBookItem(book));
    }
    return bookWidgets;
  }

  Widget _buildBookItem(ShortBook bookItem) {
    return Container(
      child: Column(
        children: [
          _buildTitleView(bookItem.title),
          _buildContentView(bookItem.content),
          _buildFunctionButtons()
        ],
      ),
    );
  }

  Widget _buildTitleView(String title) {
    return Row(
      children: [
        Text(
          title,
          style: Get.textTheme.displaySmall,
        )
      ],
    );
  }

  Widget _buildContentView(List<String> content) {
    return Row(
      children: [],
    );
  }

  Widget _buildFunctionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [],
    );
  }
}
