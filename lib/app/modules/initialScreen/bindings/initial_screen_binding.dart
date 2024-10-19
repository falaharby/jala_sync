import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../controllers/initial_screen_controller.dart';

class InitialScreenBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<InitialScreenController>(
      () => InitialScreenController(AuthRepositories()),
    );
  }
}
