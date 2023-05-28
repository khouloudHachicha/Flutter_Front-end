import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ocr_projet_pfe/app/data/UserDataStorage.dart';
import 'package:smartrefresh/smartrefresh.dart';
import '../data/AppUrl.dart';
import '../data/Models/User.dart';

class UserService extends GetxService {
  Dio dio = Dio(BaseOptions());
  List<User> user = [];

  Future<List<User>> fetchUsers() async {
      String baseUrl = ("${AppUrl.baseUrl}${AppUrl.user}");
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        user = (response.data as List).map((data) => User.fromJson(data)).toList();
        print(user.length);
      } else {
        print("Failed");
      }
    return user;
  }
  Future <void> deleteUser(String id) async{
    try {
      String baseUrl = ("${AppUrl.baseUrl}${AppUrl.delete}/${id}");
      final response = await dio.delete(baseUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("User deleted successfully");
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to delete user');
    }
  }
  Future<void> updateUserRole(int id, String role) async {
    try {
      String baseUrl = ("${AppUrl.baseUrl}${AppUrl.update_role}/${id}");
      Map body = {
        'role':'Admis'
      };
      final response = await dio.put(baseUrl, data: body);
      if (response.statusCode == 200) {
        print('User role updated successfully');
        Get.back();
      } else {
        throw Exception('Failed to update user role');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to update user role');
    }
  }
  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get("${AppUrl.baseUrl}${AppUrl.user}");
      if (response.statusCode == 200) {
        final jsonData = response.data as List;
        return jsonData.map((userJson) => User(
          id: userJson['id'],
          username: userJson['username'],
          cin: userJson['cin'],
          email: userJson['email'],
          phone: userJson['phone'],
          role: userJson['role']
        )).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load users');
    }
  }
}




