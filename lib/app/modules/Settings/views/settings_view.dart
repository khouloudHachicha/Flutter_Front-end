import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../login/bindings/login_binding.dart';
import '../../login/views/login_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: SizedBox(
            height: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'MyFont',
                    color: Colours.navy,letterSpacing: 1.5),
                ),
                ListTile(
                  title: Text('Edit Profile',style: TextStyle(
                    fontSize: 15,
                    color: Colours.slateBlue,)),
                  onTap: () {
                    Get.to(ProfileView());
                  },
                ),
                Divider(),
                Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'MyFont',
                    color: Colours.navy,
                      letterSpacing: 1.5),
                ),
                ListTile(
                  title: Text('Dark Mode',style: TextStyle(
                    fontSize: 15,
                    color: Colours.slateBlue,)),
                    // trailing: Obx(() => SwitchListTile(
                    //   title: Text('Dark Mode'),
                    //   value: controller.isDarkMode.value,
                    //   onChanged: (value) => controller.isDarkMode.value = value,
                    // )),
                    ),
                Divider(),
                TextButton(
                  child: Text('Logout',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'MyFont',
                    color: Colours.navy,
                      letterSpacing: 1.5),),
                  onPressed: () {
                    Get.off(() => LoginView(), binding: LoginBinding());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
