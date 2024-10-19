import 'package:get/get.dart';
import 'package:jala_verification/app/modules/home/controllers/home_controller.dart';
import 'package:jala_verification/app/modules/patungan/controllers/patungan_controller.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';

import '../controllers/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(AuthRepositories()),
    );
    Get.lazyPut<PatunganController>(
      () => PatunganController(BenurRepositories()),
    );
  }
}
