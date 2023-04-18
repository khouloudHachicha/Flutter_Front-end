import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../profile/bindings/profile_binding.dart';
import '../../profile/views/profile_view.dart';
import '../../widgets/setting_group.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Settings Page'))),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(24),
          children: [
            const SettingsGroup(title: "ACCOUNT", children: [
              ListTile(
                title: Text(
                  "Username",
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
            SettingsGroup(
              title: "GENERAL",
              children: [
                ListTile(
                  title: const Text(
                    "Account Settings",
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
                const ListTile(
                  title: Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
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
                const SizedBox(
                  height: 32,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
