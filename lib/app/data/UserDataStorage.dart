import 'package:get_storage/get_storage.dart';

import 'Models/User.dart';

class UserDataStorage {
  static final appPref = GetStorage('data');

  static User get userData {
    if (appPref.read('user') is User) {
      return appPref.read('user');
    } else {
      return User.fromJson(appPref.read('user'));
    }
  }
}