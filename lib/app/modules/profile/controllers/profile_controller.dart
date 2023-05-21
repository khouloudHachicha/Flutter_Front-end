import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Services/UserService.dart';
import '../../../data/AppUrl.dart';
import '../../../data/Models/User.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  final UserService _userService = UserService();
  final RxList<User> users = RxList([]);
  var isPasswordHidden = true.obs;
  final RxBool isPasswordVisible = true.obs;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final cinController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  var email = ''.obs;
  var username = ''.obs;
  var cin = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      final loadedUsers = await _userService.getUsers();
      users.value = loadedUsers;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load user data',
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  isValidCin() {
    if (cin.value.isEmpty) {
      Get.snackbar('Error', 'CIN field cannot be empty');
      return false;
    } else if (!GetUtils.isNumericOnly(cin.value)) {
      Get.snackbar('Error', 'CIN should contain only numbers');
      return false;
    } else if (cin.value.length != 8) {
      Get.snackbar('Error', 'CIN should be exactly 8 digits long');
      return false;
    } else {
      return true;
    }
  }

  isValidPhone() {
    if (phone.value.isEmpty) {
      Get.snackbar('Error', 'Phone number field cannot be empty');
      return false;
    } else if (!GetUtils.isPhoneNumber(phone.value)) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return false;
    } else {
      return true;
    }
  }

  isValidPassword() {
    if (password.value.isEmpty) {
      Get.snackbar('Error', 'Password field cannot be empty');
      return false;
    } else if (password.value.length < 6) {
      Get.snackbar('Error', 'Password should be at least 6 characters long');
      return false;
    } else {
      return true;
    }
  }

  isValidEmail() {
    if (email.value.isEmpty) {
      Get.snackbar('Error', 'Email field cannot be empty');
      return false;
    } else if (!GetUtils.isEmail(email.value)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    } else {
      return true;
    }
  }

  emailvalidation(value) {
    if (!GetUtils.isEmail(value!)) {
      return 'email is not valid';
    }
  }

  Future<void> register(String id) async {
    try {
      var dio = Dio();
      dio.options.headers = {'Content-Type': 'application/json'};
      var url = ("${AppUrl.baseUrl}${AppUrl.update}/${id}");
      Map body = {
        'username': usernameController.text,
        'email': emailController.text.trim(),
        'cin': cinController.text,
        'phone': phoneController.text,
      };
      final response = await dio.put(url, data: body);
      if (response.statusCode == 200) {
        usernameController.clear();
        emailController.clear();
        cinController.clear();
        phoneController.clear();
      } else {
        throw jsonDecode(response.data)["message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      print(e);
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              backgroundColor: Colors.red,
              contentPadding: EdgeInsets.all(20),
              children: [
                Text("error! invalid data ",
                  style: TextStyle(color: Colors.white),)
              ],
            );
          });
    }
  }
}
