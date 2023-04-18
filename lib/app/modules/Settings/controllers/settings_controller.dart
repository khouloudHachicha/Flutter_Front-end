import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  RxBool isLightTheme = false.obs;

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  saveThemeStatus() async {
    SharedPreferences pref = await prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var isLight = prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    isLightTheme.value = (await isLight.value)!;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }


  @override
  void onInit() {
    super.onInit();
    getThemeStatus();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}



