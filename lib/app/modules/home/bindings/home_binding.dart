import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(AuthRepositories()),
    );
  }
}
