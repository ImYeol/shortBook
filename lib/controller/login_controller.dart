import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/bindings/home_binding.dart';
import 'package:short_book/constants/app_routes.dart';
import 'package:short_book/ui/login/login_page.dart';
import 'package:short_book/ui/home/home_page.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void onInit() {
    print("LoginController onInit");
    super.onInit();
  }

  @override
  void onReady() {
    print("LoginController onReady");
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value == null) {
      return 'Please this field must be filled1';
    } else if (value.isEmpty) {
      return 'Please this field must be filled2';
    }
    return null;
  }

  String? confirmValidator(String? value) {
    if (value == null) {
      return 'Please this field must be filled1';
    } else if (value.isEmpty) {
      return 'Please this field must be filled2';
    } else if (!passwordController.text.contains(value)) {
      return "Not matched password";
    }
    return null;
  }

  void signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      Get.snackbar("About Account", "Account message",
          snackPosition: SnackPosition.BOTTOM,
          titleText:
              Text("Account creation failed", style: Get.textTheme.labelMedium),
          messageText: Text(e.toString(), style: Get.textTheme.labelSmall));
    }
  }

  void logIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login failed", style: Get.textTheme.labelMedium),
          messageText: Text(e.toString(), style: Get.textTheme.labelSmall));
    }
  }

  void logOut() async {
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    await _auth.signOut();
  }
}
