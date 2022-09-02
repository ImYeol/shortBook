import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';

class WritingPaperPage extends StatelessWidget {
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
            onPressed: () => Get.back(),
          ),
        ),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppConfig.defaultHorizonPadding),
          child: SingleChildScrollView(
            child: Column(children: [
              _buildLineInputView("낙"),
              _buildLineInputView("동"),
              _buildLineInputView("강"),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildLineInputView(String keyword) {
    return Row(
      children: [
        Text(keyword, style: Get.textTheme.displayMedium),
        Container(
          width: 300,
          child: TextField(),
        )
      ],
    );
  }
}
