import 'package:flutter/material.dart';
import 'package:short_book/constants/app_config.dart';
import 'package:get/get.dart';
import 'package:short_book/controller/login_controller.dart';
import 'package:short_book/data/repository/user_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppConfig.defaultVerticalPadding,
          horizontal: AppConfig.defaultHorizonPadding),
      child: ListView(
        children: [
          _buildProfileHeader(),
          Divider(
            thickness: 1,
            height: 50,
          ),
          _buildAccountManagementMenu(),
          Divider(
            thickness: 1,
            height: 50,
          ),
          _buildHostModeSwitchMenu()
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.person_rounded,
          size: 50,
        ),
        Text("홍길동님", style: Get.textTheme.titleMedium),
      ],
    );
  }

  Widget _buildAccountManagementMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("계정 관리", style: Get.textTheme.titleLarge),
        SizedBox(
          height: 20,
        ),
        //_buildMenuItem(Icons.person_outline, "개인정보", GuestEditProfilePage()),
        //_buildMenuItem(
        //    Icons.lock_outline, "개인정보 보호 및 공유", GuestEditProfilePage())
      ],
    );
  }

  Widget _buildMenuItem(IconData iconData, String title, Widget router) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        iconData,
        size: 25,
      ),
      title: Text(
        title,
        style: Get.textTheme.labelMedium,
      ),
      onTap: () => Get.to(router),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 25,
      ),
    );
  }

  Widget _buildHostModeSwitchMenu() {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Align(
          alignment: Alignment.center,
          child: Text("로그아웃"),
        ),
        onPressed: () => Get.find<UserService>().signOut(),
      ),
    );
  }
}
