import 'package:get_storage/get_storage.dart';
import 'Models/User.dart';

class UserDataStorage {
  static final appPref = GetStorage();

  static void setUserData(Map<String, dynamic> val) =>
      appPref.write('user', val);

  static User get userData {
    if (appPref.read('user') is User) {
      return appPref.read('user');
    } else {
      print(appPref.read('user').toString());
      return User.fromJson(appPref.read('user'));
    }
  }

}