import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:short_book/controller/home_controller.dart';
import 'package:short_book/ui/home/bottom_item.dart';
import 'package:short_book/widgets/keep_alive_wrapper.dart';

// https://codewithandrea.com/articles/bottom-bar-navigation-with-fab/
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    //return Obx(() => _buildTabPages());
    return _buildTabPages();
  }

  Widget _buildTabPages() {
    print("rebuild");
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.pages,
        ),
        // body: Padding(
        //   padding: EdgeInsets.symmetric(
        //       vertical: AppConfig.defaultVerticalPadding,
        //       horizontal: AppConfig.defaultHorizonPadding),
        //   child: controller.pages[controller.pageIndex],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.prepareWritingPaper,
          child: const Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Obx(() => _buildBottomAppbaritems()),
          notchMargin: 2.0,
          shape: const CircularNotchedRectangle(),
          color: Colors.brown[700],
        ),
      ),
    );
  }

  Widget _buildBottomAppbaritems() {
    return Container(
        height: 80,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              controller.pages.length,
              (index) => BottomItem(
                  controller.pageTitles[index],
                  controller.pageIcons[index],
                  controller.isSelected(index),
                  index)),
        ));
  }
}
