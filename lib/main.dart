import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/app_binding.dart';
import 'package:short_book/bindings/auth_guard.dart';
import 'package:short_book/bindings/friend_selection_binding.dart';
import 'package:short_book/bindings/home_binding.dart';
import 'package:short_book/bindings/login_binding.dart';
import 'package:short_book/bindings/splash_binding.dart';
import 'package:short_book/bindings/writing_book_binding.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/constants/app_theme.dart';
import 'package:short_book/controller/login_controller.dart';
import 'package:short_book/data/repository/gallery_service.dart';
import 'package:short_book/data/repository/user_service.dart';
import 'package:short_book/firebase_options.dart';
import 'package:short_book/ui/book/book_gallery_page.dart';
import 'package:short_book/ui/book/book_setting_page.dart';
import 'package:short_book/ui/book/friend_selection_page.dart';
import 'package:short_book/ui/book/writing_paper_page.dart';
import 'package:short_book/ui/home/home_page.dart';
import 'package:short_book/ui/login/login_page.dart';
import 'package:short_book/ui/splash/splash_page.dart';

// https://github.com/delay/flutter_starter
// https://velog.io/@leeeeeoy/Flutter-GetXpattern-%EC%9D%B5%ED%98%80%EB%B3%B4%EA%B8%B0
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(((value) => initServices()));
  runApp(const MyApp());
}

void initServices() {
  //UserService.instance.startService();
  Get.put(UserService());
  Get.put(GalleryService());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: AppRoute.SPLASH,
      //initialBinding: SplashBinding(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting)
      //       return SplashPage();
      //     if (snapshot.hasError) return Text(snapshot.error.toString());
      //     if (UserService.instance.uid != null) {
      //       Get.offAllNamed(AppRoute.HOME);
      //     } else {
      //       Get.offAllNamed(AppRoute.LOGIN);
      //     }
      //     return const SplashPage();
      //   },
      // ),
      getPages: [
        GetPage(
            name: AppRoute.SPLASH,
            page: () => SplashPage(),
            binding: SplashBinding()),
        GetPage(
            name: AppRoute.HOME,
            page: () => const HomePage(),
            binding: HomeBinding()),
        GetPage(
            name: AppRoute.LOGIN,
            page: () => const LoginPage(),
            binding: LoginBinding()),
        GetPage(
            name: AppRoute.SEARCH_FRIEND,
            page: () => const FriendSelectionPage(),
            binding: FriendSelectionBinding()),
        GetPage(
            name: AppRoute.BOOK_SETTING,
            page: () => BookSettingPage(),
            binding: WritingBookBinding(),
            transition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
            name: AppRoute.BOOK_WRITING,
            page: () => const WritingPaperPage(),
            transition: Transition.rightToLeft),
        GetPage(
          name: AppRoute.BOOK_GALLERY,
          page: () => BookGalleryPage(),
        ),
      ],
    );
  }
}
