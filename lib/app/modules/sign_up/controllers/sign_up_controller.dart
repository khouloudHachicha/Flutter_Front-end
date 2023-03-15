import 'dart:core';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/Models/User.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var email = false.obs;
  var isPasswordHidden = true.obs;
  final Dio _dio = Dio();

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
  String? emailvalidation(value) {
    if (!GetUtils.isEmail(value!)) {
      return 'email is not valid';
    }
  }
  // void createUser(User user) async {
  //   try {
  //     final response = await dio.post<Map>('users',
  //         data: user.toJson()),
  //
  //     User.id = response.data!['id'];
  //     users.add(user);
  //   } catch (error) {
  //     throw Exception(error);
  //   }
  // }
  // }

  String? emptyField(String? e) {
    if (e == null || e.isEmpty) {
      return "Please enter your username";
    } else {
      return null;
    }
  }
// Function emailValid ()async {
// bool isValidForm=_formKey.currentState!.validate();
// print("isValidForm $isValidForm");
// if(!isValidForm){
// return;
// } else {
//
}

