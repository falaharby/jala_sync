import 'package:get/get.dart';

import '../modules/create_benur/bindings/create_benur_binding.dart';
import '../modules/create_benur/views/create_benur_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/initialScreen/bindings/initial_screen_binding.dart';
import '../modules/initialScreen/views/initial_screen_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/patungan/bindings/patungan_binding.dart';
import '../modules/patungan/views/benur/benur_view.dart';
import '../modules/patungan/views/patungan_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL_SCREEN,
      page: () => const InitialScreenView(),
      binding: InitialScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.PATUNGAN,
      page: () => const PatunganView(),
      binding: PatunganBinding(),
    ),
    GetPage(
      name: _Paths.BENUR,
      page: () => BenurView(),
      binding: PatunganBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_BENUR,
      page: () => CreateBenurView(),
      binding: CreateBenurBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
