import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/Settings/controllers/settings_controller.dart';
import 'app/routes/app_pages.dart';


void main() async{
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
ThemeData darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
