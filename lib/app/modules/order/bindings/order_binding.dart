import 'package:get/get.dart';
import 'package:jala_verification/app/services/repositories/auth_repositories.dart';
import 'package:jala_verification/app/services/repositories/pakan_repositories.dart';
import 'package:jala_verification/app/services/repositories/patungan_repositories.dart';

import '../controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
      () => OrderController(AuthRepositories(), PatunganRepositories(), PakanRepositories()),
    );
  }
}
