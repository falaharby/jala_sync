import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(AuthRepositories(), PatunganRepositories()),
    );
  }
}
