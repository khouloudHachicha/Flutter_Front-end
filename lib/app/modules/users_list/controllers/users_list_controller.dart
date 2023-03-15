import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../../Services/UserService.dart';
import '../../../data/Models/User.dart';

class UsersListController extends GetxController with StateMixin {
  Dio dio = Dio(BaseOptions());
  RxList<User> user = <User>[].obs;
  final count = 0.obs;
  @override

  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
    await getAllUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getAllUser() async {
    try {
      BaseResponse response = await UserService(
          GetIt.instance.get<DioConfiguration>().getDio())
          .getAllUser();
      user.value = (response.data as List).map((e) => User.fromJson(e)).toList();

    } catch (e) {
      print("error $e");
    }
  }

}
