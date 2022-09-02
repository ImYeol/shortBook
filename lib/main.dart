import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/constants/app_theme.dart';
import 'package:short_book/controller/login_controller.dart';
import 'package:short_book/firebase_options.dart';
import 'package:short_book/ui/home/home_page.dart';
import 'package:short_book/ui/splash/splash_page.dart';

// https://github.com/delay/flutter_starter
// https://velog.io/@leeeeeoy/Flutter-GetXpattern-%EC%9D%B5%ED%98%80%EB%B3%B4%EA%B8%B0
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(((value) => Get.put(LoginController())));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      home: const SplashPage(),
    );
  }
}
