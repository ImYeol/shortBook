import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/book_setting_binding.dart';
import 'package:short_book/bindings/friend_selection_binding.dart';
import 'package:short_book/bindings/home_binding.dart';
import 'package:short_book/bindings/login_binding.dart';
import 'package:short_book/bindings/writing_book_binding.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/constants/app_theme.dart';
import 'package:short_book/data/repository/feed_service.dart';
import 'package:short_book/data/repository/gallery_service.dart';
import 'package:short_book/data/repository/message_service.dart';
import 'package:short_book/data/repository/user_service.dart';
import 'package:short_book/firebase_options.dart';
import 'package:short_book/ui/book/book_gallery_page.dart';
import 'package:short_book/ui/book/book_setting_page.dart';
import 'package:short_book/ui/book/friend_selection_page.dart';
import 'package:short_book/ui/book/writing_paper_page.dart';
import 'package:short_book/ui/home/home_page.dart';
import 'package:short_book/ui/login/login_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// https://github.com/delay/flutter_starter
// https://velog.io/@leeeeeoy/Flutter-GetXpattern-%EC%9D%B5%ED%98%80%EB%B3%B4%EA%B8%B0
//https://velog.io/@tmdgks2222/Flutter-flutternativesplash
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(((value) => initServices()));
  runApp(const MyApp());
}

void initServices() {
  //UserService.instance.startService();
  Get.put(UserService());
  Get.put(GalleryService());
  Get.put(MessageService());
  Get.put(FeedService());
  Future.delayed(const Duration(milliseconds: 500), () {
    Get.find<UserService>().init();
    Get.find<MessageService>().init();
    Get.find<FeedService>().init();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: isLoggedIn ? AppRoute.HOME : AppRoute.LOGIN,
      initialBinding: isLoggedIn ? HomeBinding() : LoginBinding(),
      getPages: [
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
            binding: BookSettingBinding(),
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 200)),
        GetPage(
            name: AppRoute.BOOK_WRITING,
            page: () => const WritingPaperPage(),
            binding: WritingBookBinding(),
            transition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200)),
        GetPage(
          name: AppRoute.BOOK_GALLERY,
          page: () => BookGalleryPage(),
        ),
      ],
    );
  }
}
