import 'package:colours/colours.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/UserService.dart';
import '../../../data/Models/User.dart';

class UsersListController extends GetxController with StateMixin <List<String>>{
  final UserService _userService = UserService();
  final RxList<User> users = RxList([]);
  var showVerificationBox = false.obs;
  Dio dio = Dio(BaseOptions());

  @override

  void onInit() async {
    fetchUsers();
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }


  void openDialog(int id) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colours.navy,
        title: const Text('you wanna make this user an admin?',
            style: TextStyle(
          fontFamily: 'MyFont',
          color: Colors.white, )),
        actions: [
          TextButton(
            child: const Text("Yes",style: TextStyle(
              color: Colors.white, )),
            onPressed: () => _userService.updateUserRole(id, 'role'),
          ),
          TextButton(
            child: const Text("No",style: TextStyle(
              color: Colors.white, )),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Future fetchUsers() async {
    try {
      final  users = await _userService.getUsers();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load users',
        duration: Duration(seconds: 3),
      );
    }
  }
  Future delete(String id) async {
    try {
       await _userService.deleteUser(id);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete user',
        duration: Duration(seconds: 3),
      );
    }
  }

}
