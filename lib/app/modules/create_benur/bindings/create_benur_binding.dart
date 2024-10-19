import 'package:get/get.dart';

import '../controllers/create_benur_controller.dart';

class CreateBenurBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBenurController>(
      () => CreateBenurController(),
    );
  }
}
