import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/Settings/controllers/settings_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      //theme: SettingsController.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
