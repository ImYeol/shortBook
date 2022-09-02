import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/login_controller.dart';
import 'package:short_book/ui/login/signup_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "LOG IN",
              style: Get.textTheme.displaySmall,
            ),
            _buildInputForm()
          ],
        ),
      ),
    ));
  }

  Widget _buildInputForm() {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: controller.validator,
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: controller.validator,
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Log In'),
              onPressed: controller.logIn,
            ),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () => Get.to(SignUpPage()),
            )
          ],
        ),
      ),
    );
  }
}
