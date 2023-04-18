import 'dart:core';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final cinController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxnString errorText = RxnString(null);
  Rxn<Function()> submitFunc = Rxn<Function()>(null);
  var username = ''.obs;
  var cin = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    print(isvalid);
  }

// Function validateForm(){
//   if (_formKey.currentState.validate()) {
//     bool isValidForm=_formKey.currentState.validate();
//     print("isValidForm $isValidForm");
//     if(!isValidForm){
//       return;
//     } else {
//
//     }
  bool isValidUsername() {
    if (username.value.isEmpty) {
      Get.snackbar('Error', 'Username field cannot be empty');
      return false;
    } else if (username.value.length < 3) {
      Get.snackbar('Error', 'Username should be at least 3 characters long');
      return false;
    } else {
      return true;
    }
  }

  bool isValidCin() {
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

  bool isValidPhone() {
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
  bool isValidPassword() {
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
  bool isValidEmail() {
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

String? emailvalidation(value) {
  if (!GetUtils.isEmail(value!)) {
    return 'email is not valid';
  }
}
  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      final dio = Dio();
      final response = await dio.post(
        'http://192.168.137.1:65209/users',
        data: {
          'username': usernameController.text,
          'email': emailController.text,
          'cin': cinController.text,
          'phone': phoneController.text,
          'password': passwordController.text,

        },
      );
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Registration successful!');
      } else {
        Get.snackbar('Error', 'Registration failed');
      }
    }
  }

  Future<bool> Function() submitFunction() {
    return () async {
      print('Make database call to create ${usernameController.value} account');
      await Future.delayed(const Duration(seconds: 1), () => print('User account created'));
      return true;
    };
  }
  // void validations(String val) async {
  //   errorText.value = null; // reset validation errors to nothing
  //   submitFunc.value = null; // disable submit while validating
  //   if (val.isNotEmpty) {
  //     if (lengthOK(val) && await available(val)) {
  //       print('All validations passed, enable submit btn...');
  //       submitFunc.value = submitFunction();
  //       errorText.value = null;
  //     }
  //   }
  // }


}

