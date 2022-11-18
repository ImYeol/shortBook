import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/home_binding.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/controller/writing_paper_controller.dart';
import 'package:short_book/ui/home/home_page.dart';

class WritingPaperPage extends GetView<WritingPaperController> {
  const WritingPaperPage({Key? key}) : super(key: key);

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
              onPressed: () =>
                  Get.until((route) => Get.currentRoute == AppRoute.HOME)),
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppConfig.defaultHorizonPadding),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  controller.title.length,
                  (index) => _buildLineInputView(controller.title[index],
                      controller.inputControllers![index])),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: _buildUploadButton(),
        ),
      ),
    );
  }

  Widget _buildLineInputView(
      String keyword, TextEditingController inputController) {
    return Row(
      children: [
        Text(keyword, style: Get.textTheme.displayMedium),
        Container(
          width: 300,
          child: TextField(
            controller: inputController,
          ),
        )
      ],
    );
  }

  Widget _buildUploadButton() {
    return Container(
        width: double.infinity,
        height: 50,
        color: Color.fromARGB(255, 94, 94, 94),
        child: TextButton(
          child: Text(
            '완료',
            style: Get.textTheme.bodyLarge,
          ),
          onPressed: () => controller.onUploadButtonPressed(),
        ));
  }
}
