import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/login_controller.dart';

class SignUpPage extends GetView<LoginController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "SIGN UP",
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
            TextFormField(
              controller: controller.passwordConfirmController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              validator: controller.validator,
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: controller.signUp,
            ),
          ],
        ),
      ),
    );
  }
}
