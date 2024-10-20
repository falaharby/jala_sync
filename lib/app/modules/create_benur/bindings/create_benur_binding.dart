import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/benur_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

import '../controllers/create_benur_controller.dart';

class CreateBenurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBenurController>(
      () => CreateBenurController(
        AuthRepositories(),
        PatunganRepositories(),
        PakanRepositories(),
        BenurRepositories(),
      ),
    );
  }
}
