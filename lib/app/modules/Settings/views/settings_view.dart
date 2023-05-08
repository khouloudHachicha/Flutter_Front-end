import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/data/Models/User.dart';

import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../profile/bindings/profile_binding.dart';
import '../../profile/views/profile_view.dart';
import '../../sign_up/controllers/sign_up_controller.dart';
import '../../users_list/bindings/users_list_binding.dart';
import '../../users_list/views/users_list_view.dart';
import '../../widgets/setting_group.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SignUpController signUpController=Get.find();
   SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
          title: Center(
              child: Text(
                  'Settings Page',
                  style: TextStyle(
                      color: Colours.navy))
          )),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(24),
          children: [
             SettingsGroup(title: "ACCOUNT", children: [
              ListTile(
                title: Text("${signUpController.usernameController}",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                subtitle: Text(
                  'Email',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                leading: Icon(Icons.account_circle, color: Colors.white, size: 50),
              ),
            ]),
            SettingsGroup(title: "APPERENCE", children: [
              Obx(() {
                return SwitchListTile(
                  title: const Text(
                    "Dark mode",
                    style: TextStyle(color: Colors.white),
                  ),
                  secondary: const Icon(
                    Icons.dark_mode,
                    color: Colors.white,
                  ),
                  value: controller.isLightTheme.value,
                  onChanged: (val) {
                    controller.isLightTheme.value = val;
                    Get.changeTheme(!val ? ThemeData.light() : ThemeData.dark());

                    Get.changeThemeMode(
                      controller.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                    );
                    controller.saveThemeStatus();
                  },
                );
              })
            ]),
            Center(
              child: SettingsGroup(
                title: "GENERAL",
                children: [
                  ListTile(
                    title: const Text(
                      "Edit account",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.off(() => const ProfileView(), binding: ProfileBinding());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "User list",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.off(() =>  const UsersListView(), binding: UsersListBinding());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Invoice list",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.off(() =>  const UsersListView(), binding: UsersListBinding());
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Get.off(() => LoginView(), binding: LoginBinding());
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
