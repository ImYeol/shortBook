import 'dart:async';

import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/repository/user_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print("splashController init");
    super.onInit();
  }

  void checkUserLogin() {
    Timer(const Duration(seconds: 3), () {
      print("splash timer");
      Get.find<UserService>().startService();
      // if (UserService.instance.currentUser != null) {
      //   Get.offNamed(AppRoute.HOME);
      // } else {
      //   Get.offNamed(AppRoute.LOGIN);
      // }
    });
  }
}
