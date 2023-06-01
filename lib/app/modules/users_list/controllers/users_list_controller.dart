import 'package:colours/colours.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/UserService.dart';
import '../../../data/Models/User.dart';

class UsersListController extends GetxController with StateMixin <List<String>>{
  final UserService _userService = UserService();
   RxList<User> users = <User>[].obs;
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
        title: const Text('Are you sure you wanna make this user as admin ?',
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
  void verifDialog(int id) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colours.navy,
        title: const Text('Are you sure you wanna remove this admin ?',
            style: TextStyle(
              fontFamily: 'MyFont',
              color: Colors.white, )),
        actions: [
          TextButton(
            child: const Text("Yes",style: TextStyle(
              color: Colors.white, )),
            onPressed: () => _userService.updateUserRoleAsUser(id, 'role'),
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
        users.value = await _userService.getUsers();
      print(users.length);
      print("success");
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load users',
        duration: Duration(seconds: 3),
      );
    }
  }
  void searchUser(String username) async {
    final filteredUsers = await _userService.searchUsers(username);
    users.value = filteredUsers;
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
