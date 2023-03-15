import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../data/Models/User.dart';

class UserService extends GetxService {
  Dio dio = Dio(BaseOptions());
  List<User> user = [];

  Future<List<User>> fetchUsers() async {
    String baseUrl = "http://192.168.137.1/api/users";
    final response = await dio.get(baseUrl);
    if (response.statusCode == 200 || response.statusCode == 201) {
      user = (response.data as List).map((data) => User.fromJson(data)).toList();
      print(user.length);
    } else
      print("Failed");

    return user;
  }
}




