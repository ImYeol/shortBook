import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/data/repository/user_service.dart';

class AuthGuard extends GetMiddleware {
//   Get the auth service
  final authService = Get.find<UserService>();

//   The default is 0 but you can update it to any number. Please ensure you match the priority based
//   on the number of guards you have.
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Navigate to login if client is not authenticated other wise continue
    if (authService.currentUser == null)
      return const RouteSettings(name: AppRoute.LOGIN);
    return const RouteSettings(name: AppRoute.HOME);
  }
}
