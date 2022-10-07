import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/controller/splash_controller.dart';
import 'package:short_book/data/repository/user_service.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(SplashController());
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("splash page");
    //Get.put(UserService());
    //Get.put(SplashController());
    controller.checkUserLogin();
    return Center(
      child: Text(
        "Short Book",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
