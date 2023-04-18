import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/Settings/controllers/settings_controller.dart';
import 'app/routes/app_pages.dart';


void main() async{
  await GetStorage.init();
  final controller = Get.put(SettingsController());
  runApp(
    GetMaterialApp(
      theme: controller.theme,
      debugShowCheckedModeBanner: false,

      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
