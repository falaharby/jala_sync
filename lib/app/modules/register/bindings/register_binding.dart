import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(AuthRepositories()),
    );
  }
}
