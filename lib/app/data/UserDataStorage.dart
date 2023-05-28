import 'package:get_storage/get_storage.dart';
import 'Models/User.dart';

class UserDataStorage {
  static final appPref = GetStorage('data');

  static void setUserData(Map<String, dynamic> val) =>
      appPref.write('user', val);

  static bool get isUserLoggedIn => appPref.hasData('user');

  static User? get userData {
    if (isUserLoggedIn) {
      dynamic user = appPref.read('user');
      if (user is User) {
        return user;
      } else {
        return User.fromJson(user);
      }
    }
  }
}