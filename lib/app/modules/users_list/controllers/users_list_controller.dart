import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../Services/UserService.dart';
import '../../../data/Models/User.dart';

class UsersListController extends GetxController with StateMixin {
  final UserService _userService = UserService();
  final RxList<User> users = RxList([]);
  final count = 0.obs;
  @override

  void onInit() async {
    fetchUsers();
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

  Future<void> fetchUsers() async {
    try {
      final loadedUsers = await _userService.getUsers();
      users.value = loadedUsers;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load users',
        duration: Duration(seconds: 3),
      );
    }
  }
}
