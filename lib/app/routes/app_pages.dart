import 'package:get/get.dart';

import '../modules/Consulter_Facture/bindings/consulter_facture_binding.dart';
import '../modules/Consulter_Facture/views/consulter_facture_view.dart';
import '../modules/Facture_list/bindings/facture_list_binding.dart';
import '../modules/Facture_list/views/facture_list_view.dart';
import '../modules/Settings/bindings/settings_binding.dart';
import '../modules/Settings/views/settings_view.dart';
import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/users_list/bindings/users_list_binding.dart';
import '../modules/users_list/views/users_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => spalshScreen(),
      transition: Transition.fade,
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.USERS_LIST,
      page: () => const UsersListView(),
      binding: UsersListBinding(),
    ),
    GetPage(
      name: _Paths.FACTURE_LIST,
      page: () =>  FactureListView(),
      binding: FactureListBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.CONSULTER_FACTURE,
      page: () => const ConsulterFactureView(),
      binding: ConsulterFactureBinding(),
    ),
  ];
}
